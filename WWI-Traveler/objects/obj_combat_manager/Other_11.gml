///@desc Methods, combat menu
combat_menu_create = function() {
	
	// Attack button
	var _y = 100;
	instance_create_depth(256, _y, depth, obj_combat_menu_attack, {
		my_combatant: active_combatant,
		callback: attack,
	});
	
	// Move button
	_y += 100;
	instance_create_depth(256, _y, depth, obj_combat_menu_move, {
		my_combatant: active_combatant,
		callback: move,
	});
	
	// Pass button
	_y += 100;
	instance_create_depth(256, _y, depth, obj_combat_menu_pass, {
		my_combatant: active_combatant,
		callback: pass,
	});
}