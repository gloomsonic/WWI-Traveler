///@desc methods
end_turn = function() {
	turn_done = true;
}
get_team = function(_team_index) {
	var _team = [];
	for (var i = 0; i < array_length(combatants); i++) {
		var _combatant = combatants[i];
		if (_combatant.team != _team_index) continue;
		array_push(_team, _combatant);
	}
	return _team;
}

// Start attack animations
init_attack = function(_attacker, _target) {
	_attacker.start_attack();
	_target.start_hit(_attacker.damage);
	
	_attacker.ready = false;
	_target.ready = false;
}

