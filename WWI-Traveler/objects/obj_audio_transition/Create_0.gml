self [$ "volume_start"] ??= -1;
self [$ "volume_target"] ??= -1;
self [$ "fade_duration"] ??= -1; // in frames // in seconds
self [$ "my_sound"] ??= noone;

volume_current = volume_start;
volume_diff = abs(volume_target - volume_start)
volume_spd = volume_diff / fade_duration;