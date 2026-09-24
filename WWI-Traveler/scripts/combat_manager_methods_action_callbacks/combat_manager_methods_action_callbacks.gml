// Spawn buttons to select enemy combatants
on_attack_melee_selected = function() {	
	combat_menu_destroy();
	
	var _valid_targets = combatant_get_targets(active_combatant);
	for (var i = 0; i < array_length(_valid_targets); i++) {
		var _combatant = _valid_targets[i];
		var _actor = combatant_get_actor(_combatant);
		
		// Spawn on actor
		instance_create_depth(_actor.x, _actor.y, depth, obj_combat_select_enemy, {
			my_combatant: _combatant,
			attacker: active_combatant,
			callback: attack_melee,
			attack_type: Attack_Type.melee,
		});
		instance_create_depth(0, 0, depth, obj_combat_select_back);
	}	
}

// Record attacked target and subtract damage from its hp
attack_melee = function(_target) {
	array_push(combat_log, $"{active_combatant.name} attacked {_target.name}");
	obj_combat_animation_manager.add_action(new cutscene_attack(active_combatant, _target));
	
	// Roll to hit
	var _weapon = active_combatant.my_weapon;
	var _accuracy = attack_melee_get_accuracy(_weapon, _target.row);
	var _roll = irandom(100);
	
	// Execute and log hit
	if (_roll <= _accuracy) {
		var _damage = _weapon.damage_melee;
		_target.hp -= _damage;
		array_push(combat_log, $"{_target.name} took {_damage} damage");
		obj_combat_animation_manager.add_action(new cutscene_hit(_target, _damage));	
	} else
		array_push(combat_log, $"{active_combatant.name} missed");

	// Check dead
	if (_target.hp <= 0) {
		array_push(combat_log, $"{_target.name} died");
		obj_combat_animation_manager.add_action(new cutscene_die(_target));
	}

	// Ask combat manager to tell us when it's done
	obj_combat_animation_manager.set_callback(turn_end);
}

// Spawn buttons to select enemy combatants
on_attack_ranged_selected = function() {	
	combat_menu_destroy();
	
	var _valid_targets = combatant_get_targets(active_combatant);
	for (var i = 0; i < array_length(_valid_targets); i++) {
		var _combatant = _valid_targets[i];
		var _actor = combatant_get_actor(_combatant);
		
		// Spawn on actor
		instance_create_depth(_actor.x, _actor.y, depth, obj_combat_select_enemy, {
			my_combatant: _combatant,
			attacker: active_combatant,
			callback: attack_melee,
			attack_type: Attack_Type.ranged,
		});
		instance_create_depth(0, 0, depth, obj_combat_select_back);	
	}	
}

// Record attacked target and subtract damage from its hp
attack_ranged = function(_target) {
	array_push(combat_log, $"{active_combatant.name} shot {_target.name}");
	
	// Roll to hit
	var _weapon = active_combatant.my_weapon;
	var _accuracy = _weapon.accuracy_ranged;
	var _roll = irandom(100);
	
	// Execute and log hit
	if (_roll <= _accuracy) {
		var _damage = _weapon.damage_ranged;
		_target.hp -= _damage;
		array_push(combat_log, $"{_target.name} took {_damage} damage");
	} else
		array_push(combat_log, $"{active_combatant.name} missed");

	// Check dead
	if (_target.hp <= 0) {
		array_push(combat_log, $"{_target.name} died");
		obj_combat_animation_manager.add_action(new cutscene_die(_target));
	}
	
	// Ask combat manager to tell us when it's done
	obj_combat_animation_manager.set_callback(turn_end);
}

// Spawn buttons to select a position to move to
on_move_selected = function() {
	combat_menu_destroy();
	
	for (var r = 0; r < 2; r++) {
		for (var c = 0; c < 3; c++) {
			instance_create_depth(0, 0, depth, obj_combat_select_move, {
				row: r,
				col: c,
				my_combatant: combatant_get_at_position(r, c),
				callback: move,
			});
		}
	}	
	instance_create_depth(0, 0, depth, obj_combat_select_back);
}

// Swap positions with another combatant, or move to an empty space
move = function(_row, _col) {
	var _other_combatant = combatant_get_at_position(_row, _col);
	
	var _row_prev = active_combatant.row;
	var _col_prev = active_combatant.col
	active_combatant.row = _row;
	active_combatant.col = _col;
	array_push(combat_log, $"{active_combatant.name} moved to row:{_row}, col:{_col}");	
	
	// If combatant already there, swap
	if (_other_combatant != noone) {
		_other_combatant.row = _row_prev;
		_other_combatant.col = _col_prev;
		array_push(combat_log, $"{_other_combatant.name} moved to row:{_row_prev}, col:{_col_prev}");
	}
	turn_end();	
}

// Skip active combatant's turn
pass = function() {
	combat_menu_destroy();
	array_push(combat_log, $"{active_combatant.name} passed");	
	turn_end();
}