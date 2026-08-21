if (instance_number(object_index) > 1) {
    instance_destroy();
    exit;
}
audio_play_tracked("music", EV_MUSIC);