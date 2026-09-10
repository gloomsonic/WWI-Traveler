///@desc methods, Combat Menu
combat_menu_create = function() {
	var _y = 100;
	var _ypad = 100;
	instance_create_depth(256, _y, depth, obj_combat_menu_label, {
		my_combatant: active_combatant,
	});
	
	// Attack button
	_y += _ypad;
	instance_create_depth(256, _y, depth, obj_combat_menu_attack, {
		my_combatant: active_combatant,
		callback: on_attack_selected,
	});
	
	// Move button
	_y += _ypad;
	instance_create_depth(256, _y, depth, obj_combat_menu_move, {
		my_combatant: active_combatant,
		callback: on_move_selected,
	});
	
	// Pass button
	_y += _ypad;
	instance_create_depth(256, _y, depth, obj_combat_menu_pass, {
		my_combatant: active_combatant,
		callback: pass,
	});
}