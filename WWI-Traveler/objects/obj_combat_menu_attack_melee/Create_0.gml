event_inherited();

self[$ "my_combatant"] ??= noone;
self[$ "callback"] ??= function(){};
obj_cursor_combat.add_touchable(id);

text = "Strike";
draw_set();
image_xscale = 512 / sprite_width;
image_yscale = (font_height() * 1.4) / sprite_height;