function combat_menu_create(_combatant) {
	var _lh = sprite_get_height(spr_combat_menu_attack);
	var _y = ROOM_H - 500;
	instance_create_layer(0, _y, "menu", obj_combat_menu_label, {my_combatant: _combatant});
	
	// Combat actions
	instance_create_layer(0, _y, "menu", obj_combat_menu_attack);
	_y += _lh;
	instance_create_layer(0, _y, "menu", obj_combat_menu_guard);
	_y += _lh;
	instance_create_layer(0, _y, "menu", obj_combat_menu_reposition);
	_y += _lh;
	instance_create_layer(0, _y, "menu", obj_combat_menu_pass);
}