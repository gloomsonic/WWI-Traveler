// Author: Nick DeJohn
// This script handles the bulk functionality of using FMOD with Game Maker.



// ----------------------------------------------------------------------------------------
// -------------------- FMOD UTILITY FUNCTIONS --------------------------------------------
// ----------------------------------------------------------------------------------------

// Checks if FMOD is ready
function audio_ready() {
      return instance_exists(obj_audio_manager) && obj_audio_manager.fmod_ready;
  }

// Reads FMOD event decription - needed to create an event instance
function audio_desc(_path) {
    var _cache = obj_audio_manager.event_desc_cache;
    if (!variable_struct_exists(_cache, _path)) {
        _cache[$ _path] = fmod_studio_system_get_event(_path);
    }
    return _cache[$ _path];
}

// Sets the audio attributes
function audio_attributes(_x, _y) {
    var _a = new Fmod3DAttributes();
    _a.position.x = _x / global.audio_ppm;
    _a.position.y = _y / global.audio_ppm;
    _a.forward.z  = 1;
    _a.up.y       = 1;
    return _a;
}

// Sets the audio position on an object
function audio_set_position(_name, _x, _y) {
	var _act = obj_audio_manager.active;
	if (variable_struct_exists(_act, _name)) {
		fmod_studio_event_instance_set_3d_attributes(_act[$ _name].inst, audio_attributes(_x, _y));
	}
}

// ----------------------------------------------------------------------------------------
// -------------------- AUDIO BUS SETTERS AND GETTERS -------------------------------------
// ----------------------------------------------------------------------------------------

// --- FMOD BUS VOLUME ---

// Bottom of the slider in dB. -60 is a common choice; -40 is gentler, -80 steeper.
// (A #macro is global, so this can live here or be moved to scr_audio_events.)
#macro AUDIO_MIN_DB -60

// Resolve an FMOD bus from its path, caching the reference.
function audio_bus(_path) {
    var _cache = obj_audio_manager.bus_cache;
    if (!variable_struct_exists(_cache, _path)) {
        var _bus = fmod_studio_system_get_bus(_path);
        if (fmod_last_result() != FMOD_RESULT.OK)
            log($"[AUDIO] bus lookup failed for \"{_path}\": {fmod_error_string()} (check the path matches FMOD Studio, case-sensitive)");
        _cache[$ _path] = _bus;
    }
    return _cache[$ _path];
}

// 0..1 slider position -> linear gain that feels perceptually even.
function audio_slider_to_gain(_t) {
    if (_t <= 0) return 0;   // true silence at the bottom
    if (_t >= 1) return 1;   // unity at the top
    return power(10, (1 - _t) * AUDIO_MIN_DB / 20);
}

// Inverse: linear gain -> 0..1 slider position (for initializing a slider from a saved value).
function audio_gain_to_slider(_g) {
    if (_g <= 0) return 0;
    if (_g >= 1) return 1;
    return 1 - (20 * log10(_g)) / AUDIO_MIN_DB;
}

// Set a bus volume from a 0..1 slider position (perceptually linear).
function audio_bus_set_volume(_path, _t) {
    if (!audio_ready()) return;
    fmod_studio_bus_set_volume(audio_bus(_path), audio_slider_to_gain(_t));
}

// Read a bus volume back as a 0..1 slider position.
function audio_bus_get_volume(_path) {
    if (!audio_ready()) return undefined;
    return audio_gain_to_slider(fmod_studio_bus_get_volume(audio_bus(_path)));
}

// ----------------------------------------------------------------------------------------
// -------------------- AUDIO SETTINGS (keyed by channel + persistence) -------------------
// ----------------------------------------------------------------------------------------

// File the saved volumes live in (sandboxed to the game's local storage).
#macro AUDIO_SETTINGS_FILE "audio_settings.json"

// Map a settings channel key to its FMOD bus path.
function audio_bus_path(_channel) {
    switch (_channel) {
        case "master":   return AUDIO_BUS_MASTER;
        case "sfx":      return AUDIO_BUS_SFX;
        case "music":    return AUDIO_BUS_MUSIC;
        case "ambience": return AUDIO_BUS_AMBIENCE;
        default:         return undefined;
    }
}

// Create the volume store with defaults, then overlay any saved values.
function audio_settings_init() {
    global.audio_volumes = {
        master:   1,
        sfx:      1,
        music:    1,
        ambience: 1,
    };
    audio_settings_load();
}

// Set a channel's volume (0..1 slider position), store it, and apply to the bus.
function audio_volume_set(_channel, _t) {
    _t = clamp(_t, 0, 1);
    global.audio_volumes[$ _channel] = _t;
    var _path = audio_bus_path(_channel);
    if (_path != undefined) audio_bus_set_volume(_path, _t);
    return _t;
}

// Read a channel's stored volume (0..1).
function audio_volume_get(_channel) {
    return global.audio_volumes[$ _channel];
}

// Push every stored volume to its bus. Call once FMOD is ready (e.g. after banks load).
function audio_volumes_apply() {
    var _keys = variable_struct_get_names(global.audio_volumes);
    for (var i = 0; i < array_length(_keys); i++) {
        var _path = audio_bus_path(_keys[i]);
        if (_path != undefined) audio_bus_set_volume(_path, global.audio_volumes[$ _keys[i]]);
    }
}

// Write the current volumes to disk.
function audio_settings_save() {
    var _str = json_stringify(global.audio_volumes);
    var _buf = buffer_create(string_byte_length(_str) + 1, buffer_fixed, 1);
    buffer_write(_buf, buffer_string, _str);
    buffer_save(_buf, AUDIO_SETTINGS_FILE);
    buffer_delete(_buf);
}

// Load saved volumes from disk, overlaying them onto the existing defaults.
function audio_settings_load() {
    if (!file_exists(AUDIO_SETTINGS_FILE)) return;
    var _buf = buffer_load(AUDIO_SETTINGS_FILE);
    var _str = buffer_read(_buf, buffer_string);
    buffer_delete(_buf);

    try {
        var _data = json_parse(_str);
        var _keys = variable_struct_get_names(global.audio_volumes);
        for (var i = 0; i < array_length(_keys); i++) {
            var _k = _keys[i];
            if (variable_struct_exists(_data, _k) && is_real(_data[$ _k]))
                global.audio_volumes[$ _k] = clamp(_data[$ _k], 0, 1);
        }
    } catch (_e) {
        // Malformed file -> keep defaults.
    }
}

// ----------------------------------------------------------------------------------------
// -------------------- AUDIO EVENTS PLAY AND STOP FUNCTIONS ------------------------------
// ----------------------------------------------------------------------------------------

// Plays a 2D One-Shot audio event
function audio_oneshot(_path, _params = undefined) {
    if (!audio_ready()) return undefined;
    var _inst = fmod_studio_event_description_create_instance(audio_desc(_path));
    audio_apply_params(_inst, _path, _params);
    fmod_studio_event_instance_start(_inst);
    fmod_studio_event_instance_release(_inst);
    return _inst;
}

// Plays a 3D One-Shot audio event
function audio_oneshot_3d(_path, _x, _y, _params = undefined) {
    if (!audio_ready()) return undefined;
    var _inst = fmod_studio_event_description_create_instance(audio_desc(_path));
    fmod_studio_event_instance_set_3d_attributes(_inst, audio_attributes(_x, _y));
    audio_apply_params(_inst, _path, _params);
    fmod_studio_event_instance_start(_inst);
    fmod_studio_event_instance_release(_inst);
    return _inst;
}

// Plays a 2D looping audio event
function audio_play_tracked(_name, _path) {
	if (!audio_ready()) return undefined;
    audio_stop_tracked(_name);   // replace if already playing
    var _inst = fmod_studio_event_description_create_instance(audio_desc(_path));
    fmod_studio_event_instance_start(_inst);
    obj_audio_manager.active[$ _name] = { inst: _inst, path: _path };
    return _inst;
}

// Plays a 3D looping audio event
function audio_play_tracked_3d(_name, _path, _x, _y) {
	if (!audio_ready()) return undefined;
    audio_stop_tracked(_name);
    var _inst = fmod_studio_event_description_create_instance(audio_desc(_path));
    fmod_studio_event_instance_set_3d_attributes(_inst, audio_attributes(_x, _y));
    fmod_studio_event_instance_start(_inst);
    obj_audio_manager.active[$ _name] = { inst: _inst, path: _path };
    return _inst;
}

// Stops a looping audio event
function audio_stop_tracked(_name, _fadeout = true) {
	var _act = obj_audio_manager.active;
	if (variable_struct_exists(_act, _name)) {
	    var _mode = _fadeout ? FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT : FMOD_STUDIO_STOP_MODE.IMMEDIATE;
	    var _t = _act[$ _name];
		fmod_studio_event_instance_stop(_t.inst, _mode);
		fmod_studio_event_instance_release(_t.inst);
	    variable_struct_remove(_act, _name);
	}
}


// ----------------------------------------------------------------------------------------
// -------------------- FMOD PARAMETER FUNCTIONS ------------------------------
// ----------------------------------------------------------------------------------------

function audio_param_id(_path, _param) {
    var _cache = obj_audio_manager.param_id_cache;
    var _key = _path + "::" + _param;
    if (!variable_struct_exists(_cache, _key)) {
        var _desc = fmod_studio_event_description_get_parameter_description_by_name(audio_desc(_path), _param);
        _cache[$ _key] = _desc.parameter_id;
    }
    return _cache[$ _key];
}

function audio_param(_track, _param, _value, _ignore = false) {
    var _act = obj_audio_manager.active;
    if (!variable_struct_exists(_act, _track)) return;
    var _t = _act[$ _track];
    audio_inst_param(_t.inst, _t.path, _param, _value, _ignore);
}

function audio_inst_param(_inst, _path, _param, _value, _ignore = false) {
    if (is_string(_value))
		fmod_studio_event_instance_set_parameter_by_id_with_label(_inst, audio_param_id(_path, _param), _value, _ignore);
    else
        fmod_studio_event_instance_set_parameter_by_name(_inst, _param, _value, _ignore);
}

// Apply a whole struct of { paramName : value-or-label } to an instance
function audio_apply_params(_inst, _path, _params) {
    if (_params == undefined) return;
    var _keys = variable_struct_get_names(_params);
    for (var i = 0; i < array_length(_keys); i++)
        audio_inst_param(_inst, _path, _keys[i], _params[$ _keys[i]]);
}

// Read a local parameter's current value (number, or undefined if not playing)
function audio_param_get(_track, _param) {
    var _act = obj_audio_manager.active;
    if (!variable_struct_exists(_act, _track)) return undefined;
    return fmod_studio_event_instance_get_parameter_by_name(_act[$ _track].inst, _param).value;
}

// Add _delta to a local parameter, clamped to [_min, _max]. Returns the new value.
function audio_param_add(_track, _param, _delta, _min = 0, _max = 1) {
    var _cur = audio_param_get(_track, _param);
    if (_cur == undefined) return undefined;
    var _new = clamp(_cur + _delta, _min, _max);
    audio_param(_track, _param, _new);
    return _new;
}