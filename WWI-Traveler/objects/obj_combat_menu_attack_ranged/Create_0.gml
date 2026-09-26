event_inherited();

self[$ "my_combatant"] ??= noone;
self[$ "callback"] ??= function(){};
obj_cursor_combat.add_touchable(id);

text = "Shoot";
draw_set();
image_xscale = 512 / sprite_width;
image_yscale = (font_height() * 1.4) / sprite_height;

// Can shoot?
can_shoot = true;
if (my_combatant.my_weapon.ammo_remaining <= 0)
	can_shoot = false;