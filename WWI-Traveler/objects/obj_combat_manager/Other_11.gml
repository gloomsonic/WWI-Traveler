///@desc methods Actions

// Start attack animations
init_attack = function(_attacker, _target) {
	_attacker.start_attack();
	_target.start_hit(_attacker.my_data.melee.damage, _attacker.my_data.melee.accuracy);
	
	_attacker.ready = false;
	_target.ready = false;
}

// Start repositioning
init_reposition = function(_combatant, _src_space, _dest_space) {
	var _space1 = get_row_pos_space(_src_space);
	var _space2 = get_row_pos_space(_dest_space);
	swap_combatant_datas(_space1.row, _space1.pos, _space2.row, _space2.pos);

	// Trade combatant objects
	// NOTE: I considered having the spaces 'get' their combatant from the global struct, but that would require checking like every frame
	var _trail_buddy = _dest_space.get_combatant();
	_src_space.free();
	_dest_space.free();
	_src_space.set_combatant(_trail_buddy);
	_dest_space.set_combatant(_combatant);
	
	_combatant.signal_ready();
}