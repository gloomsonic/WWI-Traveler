if (turn_over) {
	var _active_combatant = array_shift(turn_order);
	array_push(turn_order, _active_combatant);
	turn_over = false;
	combat_menu_destroy();

	// Start combatant's turn
	if (_active_combatant.my_data.cpu) {
		obj_cursor_combat.set_combatant(noone);
		
		// Attack a random player combatant
		var _player_team = combatants_team_get_ids(Combatant_Team.player);
		var _target = array_shuffle(_player_team)[0];
		start_attack(_active_combatant, _target);
	} else {
		combatant_player_start_turn(_active_combatant);
	}
}

// Next turn?
turn_over = combat_check_end_turn();