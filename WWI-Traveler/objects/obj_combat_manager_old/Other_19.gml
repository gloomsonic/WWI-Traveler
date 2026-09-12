///@desc signals

// Check every combatant's 'ready' status to end turn
signal_add(new signal_listener(id, Signal_Type.on_combatant_ready, function() {
	for (var i = 0; i < array_length(combatants); i++) {
		var _combatant = combatants[i];
		if (_combatant.ready) continue;
		return;
	}
	end_turn();
}));

// Destroy combatant and remove from the array
signal_add(new signal_listener(id, Signal_Type.on_combatant_killed, function(_combatant) {
	var _index = array_get_index(combatants, _combatant);
	array_delete(combatants, _index, 1);
	
	// Scrub from turn queue
	var _index = array_get_index(turn_queue, _combatant);
	while(_index != -1) {
		array_delete(turn_queue, _index, 1);
		var _index = array_get_index(turn_queue, _combatant);
	}
	instance_destroy(_combatant);
}));