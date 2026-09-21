///@desc methods, Combat Menu
//function combat_menu_create() {
//	var _y = 100;
//	var _ypad = 100;
//	instance_create_depth(256, _y, depth, obj_combat_menu_label, {
//		my_combatant: active_combatant,
//	});
	
//	// Melee attack button
//	_y += _ypad;
//	instance_create_depth(256, _y, depth, obj_combat_menu_attack_melee, {
//		my_combatant: active_combatant,
//		callback: on_attack_melee_selected,
//	});
	
//	// Ranged attack button
//	_y += _ypad;
//	instance_create_depth(256, _y, depth, obj_combat_menu_attack_ranged, {
//		my_combatant: active_combatant,
//		callback: on_attack_ranged_selected,
//	});
	
//	// Move button
//	_y += _ypad;
//	instance_create_depth(256, _y, depth, obj_combat_menu_move, {
//		my_combatant: active_combatant,
//		callback: on_move_selected,
//	});
	
//	// Pass button
//	_y += _ypad;
//	instance_create_depth(256, _y, depth, obj_combat_menu_pass, {
//		my_combatant: active_combatant,
//		callback: pass,
//	});
//}