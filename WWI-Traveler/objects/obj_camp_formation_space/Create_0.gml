event_inherited();

self [$ "row"] ??= -1;
self [$ "pos"] ??= -1;
self [$ "my_combatant"] ??= noone;
states.update();

obj_cursor_camp.add_touchable(id);