event_inherited();

self[$ "my_combatant_index"] ??= -1;
self[$ "my_combatant_name"] ??= "!!NO NAME!!";

// Mask same size as text
draw_set();
image_xscale = string_width(my_combatant_name) / sprite_width;
image_yscale = string_height(my_combatant_name) / sprite_height;