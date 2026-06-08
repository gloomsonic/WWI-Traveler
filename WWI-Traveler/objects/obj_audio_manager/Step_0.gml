if (fmod_ready)
{
    if (instance_exists(obj_audio_listener))
        fmod_studio_system_set_listener_attributes(0, audio_attributes(obj_audio_listener.x, obj_audio_listener.y));

    fmod_studio_system_update();
}