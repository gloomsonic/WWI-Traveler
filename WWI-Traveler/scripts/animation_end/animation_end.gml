function animation_end() {
    var spd = sprite_get_speed(sprite_index);
    if (sprite_get_speed_type(sprite_index) == spritespeed_framespersecond)
        spd /= game_get_speed(gamespeed_fps);
    return image_index + spd >= image_number;    
}