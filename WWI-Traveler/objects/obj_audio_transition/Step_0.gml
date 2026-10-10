volume_current = approach(volume_current, volume_target, volume_spd);
fmod_studio_event_instance_set_volume(my_sound, volume_current);
if (volume_current == volume_target)
	instance_destroy();