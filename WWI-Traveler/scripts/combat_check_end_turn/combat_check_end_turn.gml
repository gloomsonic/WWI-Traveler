function combat_check_end_turn() {
	var _end_turn = true;
	with (obj_combatant) {
		if (ready) continue;
		_end_turn = false;
	}
	
	//if (_end_turn)
	//	combat_menu_destroy();

	return _end_turn;
}