event_inherited();

self[$ "my_combatant"] ??= noone;
self[$ "callback"] ??= function(){};
self[$ "font"] ??= fnt_droid_serif_48;
obj_cursor_combat.add_touchable(id);

text = "Strike";
image_xscale = w / sprite_width;
image_yscale = h / sprite_height;