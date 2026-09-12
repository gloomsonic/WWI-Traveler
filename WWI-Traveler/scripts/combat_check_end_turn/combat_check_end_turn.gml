function combat_check_end_turn() {
	var _end_turn = true;
	with (obj_combatant) {
		if (ready) continue;
		_end_turn = false;
	}
	return _end_turn;
}