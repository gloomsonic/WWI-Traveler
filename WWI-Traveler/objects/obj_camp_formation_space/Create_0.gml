event_inherited();

self [$ "row"] ??= -1;
self [$ "pos"] ??= -1;
self [$ "my_combatant"] ??= noone;
states.update();

par_mouse_cursor.add_touchable(id);