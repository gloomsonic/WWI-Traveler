event_inherited();

self[$ "my_combatant"] ??= noone;
self[$ "callback"] ??= function(){};
self[$ "font"] ??= fnt_droid_serif_48;
self[$ "w"] ??= 0;
self[$ "h"] ??= 0;

text = "Reload";
image_xscale = w / sprite_width;
image_yscale = h / sprite_height;

// Not touchable if no bullets
can_reload = my_combatant.inventory.bullets > 0;
if (can_reload)
	obj_cursor_combat.add_touchable(id);