event_inherited();

par_mouse_cursor.add_touchable(id);

back = function() {
	instance_destroy(obj_combat_select_enemy);
	instance_destroy(obj_combat_select_move);
	obj_combat_manager.combat_menu_create();
	instance_destroy();
}