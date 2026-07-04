event_inherited();
self[$ "my_text"] ??= "!!NO TEXT GIVEN!!";
draw_set();

// Stretch mask to choice
my_text_width = string_width(my_text);
image_xscale = my_text_width / sprite_get_width(mask_index);
my_text_height = font_height();
image_yscale = my_text_height / sprite_get_height(mask_index);