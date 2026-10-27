event_inherited();

self[$ "active_combatant"] ??= noone;
self[$ "callback"] ??= function(){};
self[$ "font"] ??= fnt_droid_serif_48;
self[$ "w"] ??= 0;
self[$ "h"] ??= 0;
par_mouse_cursor.add_touchable(id);

text = "Move";
image_xscale = w / sprite_width;
image_yscale = h / sprite_height;