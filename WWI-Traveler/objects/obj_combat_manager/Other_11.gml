///@desc methods Actions

// Start attack animations
init_attack = function(_attacker, _target) {
	_attacker.start_attack();
	_target.start_hit(_attacker.damage);
	
	_attacker.ready = false;
	_target.ready = false;
}

// Start repositioning
init_reposition = function(_combatant, _space) {
	_combatant.x = _space.x;
	_combatant.y = _space.y;
	_combatant.signal_ready();
}