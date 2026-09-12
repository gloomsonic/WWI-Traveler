///@desc signals

// Remove dead from turn order
signal_add(new signal_listener(id, Signal_Type.on_combatant_killed, function(_dead) {
	for (var i = 0; i < array_length(turn_order); i++) {
		var _combatant = turn_order[i];
		if (_combatant != _dead) continue;
		array_delete(turn_order, i, 1);
		break;
	}
}));