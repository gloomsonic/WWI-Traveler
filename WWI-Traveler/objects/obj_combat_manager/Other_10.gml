///@desc action callbacks

// Record attacked target and subtract damage from its hp
attack = function(_target) {
	var _damage = irandom(3);
	_target.hp -= _damage;
	
	// Log it
	array_push(combat_log, $"{active_combatant.name} attacked {_target.name}");
	array_push(combat_log, $"{_target.name} received {_damage} damage");
	if (_target.hp <= 0)
		array_push(combat_log, $"{_target.name} died");

	// Proceed -- In theory, this is where we'd queue the animation?
	turn_end();
}

//
move = function(_row, _col) {
	var _other_combatant = combatant_get_at_position(_row, _col);
	
	var _row_prev = active_combatant.row;
	var _col_prev = active_combatant.col
	active_combatant.row = _row;
	active_combatant.col = _col;
	
	// If combatant already there, swap
	if (_other_combatant != noone) {
		_other_combatant.row = _row_prev;
		_other_combatant.col = _col_prev;
	}
	
	array_push(combat_log, $"{active_combatant.name} moved to row:{_row}, col:{_col}");	
	turn_end();	
}

// Skip active combatants turn
pass = function() {
	array_push(combat_log, $"{active_combatant.name} passed");	
	turn_end();
}