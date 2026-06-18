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
		var _lh = sprite_get_height(spr_combat_menu_attack);
		var _y = ROOM_H - 500;
		instance_create_layer(0, _y, "menu", obj_combat_menu_attack);
		_y += _lh;
		instance_create_layer(0, _y, "menu", obj_combat_menu_guard);
		_y += _lh;
		instance_create_layer(0, _y, "menu", obj_combat_menu_pass);
		obj_mouse_cursor.set_combatant(_combatant); // TODO: this should maybe become a 'signal' and this code runs inside cursor
		obj_mouse_cursor.states.queue(State.select_action);
	}
}