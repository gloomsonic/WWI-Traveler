event_inherited();
self[$ "my_choice"] ??= new scene_choice("!!NO TEXT GIVEN!!", "!!NO STORY RESULT GIVEN!!")

list_margin = 128;
par_mouse_cursor.add_touchable(id);

// Stretch mask to choice
draw_set();
image_xscale = LINE_W / sprite_get_width(mask_index);
image_yscale = (font_height() * 1.6) / sprite_get_height(mask_index);

image_alpha = 0;
alpha_spd = 0.05;