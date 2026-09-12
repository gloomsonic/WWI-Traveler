event_inherited();

self[$ "my_combatant"] ??= noone;
obj_cursor_combat.add_touchable(id);

x = 500 + (my_combatant.col * 800);
y = 200 - (my_combatant.row * 100);
draw_set(c_black,, fa_center, fa_middle);
image_xscale = 700 / sprite_width;
image_yscale = string_height(my_combatant.name) / sprite_height;