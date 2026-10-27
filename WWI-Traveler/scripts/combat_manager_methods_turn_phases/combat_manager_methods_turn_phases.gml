function combat_manager_methods_turn_phases() {

	// Start the next combatant's turn
	turn_start = function() {
		active_combatant = array_shift(turn_order);
		log(array_length(turn_order));
		var _valid_targets = combatant_get_targets(active_combatant);
	
		// CPU vs. player turn
		if (active_combatant.team == Combatant_Team.enemy) {
			var _target = array_pop(array_shuffle(_valid_targets));
			combat_manager_queue_action_callback(combat_callback_attack_melee, active_combatant, [_target]);
		} else {
			combat_menu_create(active_combatant);
		}
	}
	
	// Next turn or start resolving turn
	turn_end = function() {
		if (array_length(turn_order) > 0) {
			call_next_frame(turn_start); // NOTE: must be next frame, else something like reload will destroy the new combat menu it creates
		} else {
			combat_callbacks_queue_resolve();
			obj_combat_animation_manager.actions_start(round_end);
			active_combatant = noone;
		}
	}
	
	// Loop the combat callbacks queue
	combat_callbacks_queue_resolve = function() {
		while (array_length(combat_callbacks_queue) > 0) {
			var _data = array_shift(combat_callbacks_queue);
			if (_data.active_combatant.hp <= 0)
				continue; // Skip if dead
					
			array_insert(_data.args, 0, _data.active_combatant); // First argument is always 'active_combatant'
			script_execute_ext(_data.callback, _data.args);
		}
	}

	// Check if combat end or next turn
	round_end = function() {
		turn_order_refresh();
	
		// Space for readability
		array_push(combat_log, "--------------------   ");
	
		// Next turn or end combat
		if (array_length(PARTY) <= 0) {
			array_push(combat_log, "You Died");
			room_goto(rm_game_over);
		} else if (array_length(ENEMY_PARTY) <= 0) {
			array_push(combat_log, "You Won");
			next_encounter_check_start();
		} else
			call_next_frame(turn_start);
	}

	
}