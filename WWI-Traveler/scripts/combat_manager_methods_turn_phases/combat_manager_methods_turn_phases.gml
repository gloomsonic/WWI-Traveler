// Start the next combatant's turn
turn_start = function() {
	active_combatant = array_shift(turn_order);
	array_push(turn_order, active_combatant);	
	var _valid_targets = combatant_get_targets(active_combatant);
	
	// CPU vs. player turn
	if (active_combatant.team == Combatant_Team.enemy) {
		var _target = array_pop(array_shuffle(_valid_targets));
		attack_melee(_target);
	} else {
		combat_menu_create();
	}
}

// Check if combat end or next turn
turn_end = function() {
	var _check_dead = function(_val) {
		return _val.hp > 0;
	}
	turn_order = array_filter(turn_order, _check_dead);
	PARTY = array_filter(PARTY, _check_dead);
	ENEMY_PARTY = array_filter(ENEMY_PARTY, _check_dead);
	
	// Space for readability
	array_push(combat_log, "--------------------   ");
	
	// Next turn or end combat
	if (array_length(PARTY) <= 0) {
		array_push(combat_log, "You Died");
		room_goto(rm_game_over);
	} else if (array_length(ENEMY_PARTY) <= 0) {
		array_push(combat_log, "You Won");
		room_goto(rm_camp);
	} else
		call_next_frame(turn_start) //turn_start();
}

// Create the player combat options menu
combat_menu_create = function() {
	var _y = 100;
	var _ypad = 100;
	instance_create_depth(256, _y, depth, obj_combat_menu_label, {
		my_combatant: active_combatant,
	});
	
	// Melee attack button
	_y += _ypad;
	instance_create_depth(256, _y, depth, obj_combat_menu_attack_melee, {
		my_combatant: active_combatant,
		callback: on_attack_melee_selected,
	});
	
	// Ranged attack button
	_y += _ypad;
	instance_create_depth(256, _y, depth, obj_combat_menu_attack_ranged, {
		my_combatant: active_combatant,
		callback: on_attack_ranged_selected,
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