event_inherited();

self[$ "row"] ??= -1;
self[$ "col"] ??= -1;
self[$ "my_combatant"] ??= noone;

obj_cursor_combat.add_touchable(id);

x = 500 + (col * 800);
y = 100 + (row * 100);
text = (my_combatant == noone ? "----": my_combatant.name);
draw_set(c_black,, fa_center, fa_middle);
image_xscale = 700 / sprite_width;
image_yscale = font_height() / sprite_height;