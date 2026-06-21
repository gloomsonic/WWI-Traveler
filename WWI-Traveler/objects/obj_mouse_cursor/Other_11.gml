///@desc states

state_cursor_select_action = function(_event) {
	switch(_event) {
		case Event.step: 
			touch_object(par_combat_menu);
			break;
	}
}

state_cursor_select_target = function(_event) {
	switch(_event) {
		case Event.step: 
			var _enemies = obj_combat_manager.get_team(Combatant_Team.enemy);
			var _data = touch_object(_enemies);
			if (_data.released) {
				obj_combat_manager.init_attack(my_combatant, _data.inst);
				states.queue(State.select_action);
			}
			break;
	}
}

state_cursor_select_reposition = function(_event) {
	switch(_event) {
		case Event.step: 
			var _spaces = obj_combat_manager.get_spaces(Combatant_Team.player);
			var _data = touch_object(_spaces);
			if (_data.released) {
				obj_combat_manager.init_reposition(my_combatant, my_combatant.get_space(), _data.inst);
				states.queue(State.select_action);
			}
			break;
	}
}