// Initiate next turn
if (turn_done) {
	var _combatant = array_shift(turn_queue);
	array_push(turn_queue, _combatant);
	turn_done = false;
	
	if (_combatant.cpu) { // CPU turn
		log("cpu turn");
		turn_done = true;
		obj_mouse_cursor.set_combatant(noone);
	} else { // Player turn
		log("player turn");
		instance_create_layer(0, ROOM_H - 512, "menu", obj_combat_action_menu);
		obj_mouse_cursor.set_combatant(_combatant); // TODO: this should maybe become a 'signal' and this code runs inside cursor
		obj_mouse_cursor.states.queue(State.select_action);
	}
}