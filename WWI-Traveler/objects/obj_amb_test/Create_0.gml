// Play Ambience "Test" Event
var _amb = audio_play_tracked_3d("ambience", EV_DEBUG_AMBIENCE, x, y);

// TEMP DIAG — remove once audio is fixed
show_debug_message("[AUDIO DIAG] amb_test create: audio_ready=" + string(audio_ready())
	+ " pos=(" + string(x) + "," + string(y) + ")"
	+ " event_desc=" + string(audio_desc(EV_DEBUG_AMBIENCE))
	+ " play_result=" + string(_amb)
	+ " last_result=" + string(fmod_last_result()));


dragging = false;