///@desc stop sfx
struct_foreach(sounds, function(_name, _value) {
	fmod_studio_event_instance_stop(_value, FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);
});