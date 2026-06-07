// Checks if FMOD is ready
function audio_ready() {
      return instance_exists(Audio_Manager) && Audio_Manager.fmod_ready;
  }

// Reads FMOD event decription - needed to create an event instance
function audio_desc(_path) {
    var _cache = Audio_Manager.event_desc_cache;
    if (!variable_struct_exists(_cache, _path)) {
        _cache[$ _path] = fmod_studio_system_get_event(_path);
    }
    return _cache[$ _path];
}

// Sets an the audio attributes
function audio_attributes(_x, _y) {
    var _a = new Fmod3DAttributes();
    _a.position.x = _x / AUDIO_PIXELS_PER_METER;
    _a.position.y = _y / AUDIO_PIXELS_PER_METER;
    _a.forward.z  = 1;
    _a.up.y       = 1;
    return _a;
}

// Sets the audio position on an object
function audio_set_position(_name, _x, _y) {
	var _act = Audio_Manager.active;
	if (variable_struct_exists(_act, _name)) {
		fmod_studio_event_instance_set_3d_attributes(_act[$ _name].inst, audio_attributes(_x, _y));
	}
}

// Plays a 2D One-Shot (SFX that don't need to be positioned such as UI sounds)
function audio_oneshot(_path, _params = undefined) {
    if (!audio_ready()) return undefined;
    var _inst = fmod_studio_event_description_create_instance(audio_desc(_path));
    audio_apply_params(_inst, _path, _params);
    fmod_studio_event_instance_start(_inst);
    fmod_studio_event_instance_release(_inst);
    return _inst;
}

// Plays a 3D One-Shot (SFX that are attenuated in the stereo field)
function audio_oneshot_3d(_path, _x, _y, _params = undefined) {
    if (!audio_ready()) return undefined;
    var _inst = fmod_studio_event_description_create_instance(audio_desc(_path));
    fmod_studio_event_instance_set_3d_attributes(_inst, audio_attributes(_x, _y));
    audio_apply_params(_inst, _path, _params);
    fmod_studio_event_instance_start(_inst);
    fmod_studio_event_instance_release(_inst);
    return _inst;
}

// Handles playing looping or persistent 2D tracks like music and ambience
function audio_play_tracked(_name, _path) {
	if (!audio_ready()) return undefined;
    audio_stop_tracked(_name);   // replace if already playing
    var _inst = fmod_studio_event_description_create_instance(audio_desc(_path));
    fmod_studio_event_instance_start(_inst);
    Audio_Manager.active[$ _name] = { inst: _inst, path: _path };
    return _inst;
}

// Handles playing looping or persistent 3D tracks. Good for objects that are stationary.
function audio_play_tracked_3d(_name, _path, _x, _y) {
	if (!audio_ready()) return undefined;
    audio_stop_tracked(_name);
    var _inst = fmod_studio_event_description_create_instance(audio_desc(_path));
    fmod_studio_event_instance_set_3d_attributes(_inst, audio_attributes(_x, _y));
    fmod_studio_event_instance_start(_inst);
    Audio_Manager.active[$ _name] = { inst: _inst, path: _path };
    return _inst;
}

// Handles stopping looping or persistent tracks like music and ambience
function audio_stop_tracked(_name, _fadeout = true) {
	var _act = Audio_Manager.active;
	if (variable_struct_exists(_act, _name)) {
	    var _mode = _fadeout ? FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT : FMOD_STUDIO_STOP_MODE.IMMEDIATE;
	    var _t = _act[$ _name];
		fmod_studio_event_instance_stop(_t.inst, _mode);
		fmod_studio_event_instance_release(_t.inst);
	    variable_struct_remove(_act, _name);
	}
}

// --- FMOD PARAMETER SUPPORT ---

function audio_param_id(_path, _param) {
    var _cache = Audio_Manager.param_id_cache;
    var _key = _path + "::" + _param;
    if (!variable_struct_exists(_cache, _key)) {
        var _desc = fmod_studio_event_description_get_parameter_description_by_name(audio_desc(_path), _param);
        _cache[$ _key] = _desc.parameter_id;
    }
    return _cache[$ _key];
}

function audio_param(_track, _param, _value, _ignore = false) {
    var _act = Audio_Manager.active;
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
    var _act = Audio_Manager.active;
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