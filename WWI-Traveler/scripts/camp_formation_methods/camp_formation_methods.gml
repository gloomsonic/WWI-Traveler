// Set the active space
set_active_space = function(_space) {
	active_space = _space;
}

// Return the active space
get_active_space = function() {
	return active_space;
}

// Trade combatants between two spaces
spaces_trade_combatants = function(_space1, _space2) {
	var _combatant1 = _space1.my_combatant;
	var _combatant2 = _space2.my_combatant;
	_space1.my_combatant = _combatant2;
	_space2.my_combatant = _combatant1;
	
	// Reflect trade in the global array
	if (_space1.my_combatant != noone) {
		_space1.my_combatant.row = _space1.row;
		_space1.my_combatant.col = _space1.col;
	}
	if (_space2.my_combatant != noone) {
		_space2.my_combatant.row = _space2.row;
		_space2.my_combatant.col = _space2.col;
	}
	
	set_active_space(noone);
}