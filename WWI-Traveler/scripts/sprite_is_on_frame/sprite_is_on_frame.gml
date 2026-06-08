function sprite_is_on_frame(_frame) {
    return image_index >= _frame && image_index - image_speed * sprite_get_speed(sprite_index) / (sprite_get_speed_type(sprite_index) == spritespeed_framespergameframe? 1 : game_get_speed(gamespeed_fps)) < _frame;
}