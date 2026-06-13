// Persist volume settings before shutting down
if (variable_global_exists("audio_volumes")) audio_settings_save();

if (fmod_ready)
{
    fmod_ready = false;

    var _names = variable_struct_get_names(active);
    for (var i = 0; i < array_length(_names); i++) {
        audio_stop_tracked(_names[i], false);
    }

    fmod_studio_system_unload_all();
    fmod_studio_system_release();
}