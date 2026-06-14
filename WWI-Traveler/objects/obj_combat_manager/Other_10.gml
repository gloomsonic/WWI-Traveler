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
	_target.start_flash(5);
	
	_attacker.ready = false;
	_target.ready = false;
}

// Check every combatant's 'ready' status to end turn
signal_add(new signal_listener(id, Signal_Type.on_combatant_ready, function() {
	for (var i = 0; i < array_length(combatants); i++) {
		var _combatant = combatants[i];
		if (_combatant.ready) continue;
		return;
	}
	end_turn();
}));