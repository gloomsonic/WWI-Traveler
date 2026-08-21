// Play Ambience "Test" Event
if (instance_number(object_index) > 1) {
    instance_destroy();
    exit;
}

audio_play_tracked("ambience", EV_DEBUG_AMBIENCE);


//dragging = false;