// Initiate next turn
if (turn_done) {
	var _combatant = array_shift(turn_queue);
	array_push(turn_queue, _combatant);
	turn_done = false;
	
	if (_combatant.cpu) { // CPU turn
		obj_mouse_cursor.set_combatant(noone);
		var _team_player = get_team(Combatant_Team.player);
		var _target = array_shuffle(_team_player)[0];
		obj_combat_manager.init_attack(_combatant, _target);
	} else { // Player turn
		instance_create_layer(0, ROOM_H - 512, "menu", obj_combat_action_menu);
		obj_mouse_cursor.set_combatant(_combatant); // TODO: this should maybe become a 'signal' and this code runs inside cursor
		obj_mouse_cursor.states.queue(State.select_action);
	}
}