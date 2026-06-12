///@desc states

state_cursor_select_action = function(_event) {
	switch(_event) {
		case Event.step: 
			touch_object(obj_combat_action_menu);
			break;
	}
}

state_cursor_select_target = function(_event) {
	switch(_event) {
		case Event.step: 
			var _data = touch_object(obj_combat_manager.get_enemies());
			if (_data.released) {
				obj_combat_manager.init_attack(my_combatant, _data.inst);
				states.queue(State.select_action);
			}
			break;
	}
}