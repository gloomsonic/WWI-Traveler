///@desc methods
end_turn = function() {
	turn_done = true;
}
get_enemies = function() {
	return team_enemy;
}

// 
init_attack = function(_attacker, _target) {
	_attacker.start_attack();
	_target.start_flash(5);
	
	_attacker.ready = false;
	_target.ready = false;
}

// Check every combatant's 'ready' status to end turn
signal_add(new signal_listener(id, Signal_Type.on_combatant_ready, function() {
	for (var i = 0; i < array_length(team_player); i++) {
		var _combatant = team_player[i];
		if (_combatant.ready) continue;
		return;
	}
	for (var i = 0; i < array_length(team_enemy); i++) {
		var _combatant = team_enemy[i];
		if (_combatant.ready) continue;
		return;
	}
	end_turn();
}));