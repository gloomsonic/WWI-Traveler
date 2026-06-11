// Initiate next turn
if (turn_done) {
	var _combatant = array_shift(turn_queue);
	array_push(turn_queue, _combatant);
	turn_done = false;
	
	if (_combatant.cpu) {
		log("cpu turn");
		turn_done = true;
	} else {
		log("player turn");
		instance_create_layer(0, ROOM_H - 512, "menu", obj_combat_action_menu);
		obj_mouse_cursor.set_touchable(obj_combat_action_menu);
	}
}