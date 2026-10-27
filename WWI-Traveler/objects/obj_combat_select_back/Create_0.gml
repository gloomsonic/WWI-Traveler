event_inherited();
self [$ "active_combatant"] ??= noone;
par_mouse_cursor.add_touchable(id);

back = function() {
	instance_destroy(obj_combat_select_enemy);
	instance_destroy(obj_combat_select_move);
	combat_menu_create(active_combatant);
	instance_destroy();
}