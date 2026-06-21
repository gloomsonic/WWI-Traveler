///@desc methods Actions

// Start attack animations
init_attack = function(_attacker, _target) {
	_attacker.start_attack();
	_target.start_hit(_attacker.damage);
	
	_attacker.ready = false;
	_target.ready = false;
}

// Start repositioning
init_reposition = function(_combatant, _src_space, _dest_space) {
	var _trail_buddy = _dest_space.get_combatant();
	
	// Trade combatants
	_src_space.free();
	_dest_space.free();
	_src_space.set_combatant(_trail_buddy);
	_dest_space.set_combatant(_combatant);
	
	_combatant.signal_ready();
}