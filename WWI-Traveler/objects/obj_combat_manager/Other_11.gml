///@desc methods Actions

// Start attack animations
init_attack = function(_attacker, _target) {
	_attacker.start_attack();
	_target.start_hit(_attacker.my_data.damage);
	
	_attacker.ready = false;
	_target.ready = false;
}

// Start repositioning
init_reposition = function(_combatant, _src_space, _dest_space) {

	// Get position via combatant spaces
	var _row1 = 0;
	var _pos1 = array_get_index(team_player_rows[0], _src_space);
	if (_pos1 == -1) {
		_row1 = 1;
		_pos1 = array_get_index(team_player_rows[1], _src_space);
	}
	var _row2 = 0;
	var _pos2 = array_get_index(team_player_rows[0], _dest_space);
	if (_pos2 == -1) {
		_row2 = 1;
		_pos2 = array_get_index(team_player_rows[1], _dest_space);
	}
	swap_combatant_datas(_row1, _pos1, _row2, _pos2);
	
	// Trade combatants
	// NOTE: I considered having the spaces 'get' their combatant from the global struct, but that would require checking like every frame
	var _trail_buddy = _dest_space.get_combatant();
	_src_space.free();
	_dest_space.free();
	_src_space.set_combatant(_trail_buddy);
	_dest_space.set_combatant(_combatant);
	
	_combatant.signal_ready();
}