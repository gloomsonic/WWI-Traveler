///@desc action callbacks

// Spawn buttons to select enemy combatants
on_attack_selected = function() {	
	instance_destroy(par_combat_menu);
	
	var _valid_targets = combatant_get_targets(active_combatant);
	for (var i = 0; i < array_length(_valid_targets); i++) {
		var _combatant = _valid_targets[i];
		instance_create_depth(0, 0, depth, obj_combat_select_enemy, {
			my_combatant: _combatant,
			callback: attack,
		});
	}	
}

// Record attacked target and subtract damage from its hp
// TODO: put accuracy and damage range into combatant structs
attack = function(_target) {
	array_push(combat_log, $"{active_combatant.name} attacked {_target.name}");
	
	// Roll to hit
	var _accuracy = 80;
	if (_target.row == 1)
		_accuracy *= 0.5;
	var _roll = irandom(100);
	log(_accuracy);
	
	// Execute hit
	if (_roll <= _accuracy) {
		var _damage = irandom_range(1, 3);
		_target.hp -= _damage;
		array_push(combat_log, $"{_target.name} received {_damage} damage");
	} else
		array_push(combat_log, $"{active_combatant.name} missed");

	// Check dead
	if (_target.hp <= 0)
		array_push(combat_log, $"{_target.name} died");

	// Proceed -- In theory, this is where we'd queue the animation?
	turn_end();
}

// Spawn buttons to select a position to move to
on_move_selected = function() {
	instance_destroy(par_combat_menu);
	
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
	array_push(combat_log, $"{active_combatant.name} passed");	
	turn_end();
}