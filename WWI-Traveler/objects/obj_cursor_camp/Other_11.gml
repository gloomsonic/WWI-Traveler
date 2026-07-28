event_inherited();

state_cursor_camp_free = function(_event) {
	switch(_event) {
		case Event.step: 
			touch_object(par_touchable);
			break;
	}
}

state_cursor_camp_formation = function(_event) {
	switch(_event) {
		case Event.step: 
			touch_object(obj_camp_formation_space);
			
			// Exit state
			if (mouse_check_button_pressed(mb_right)) {
				obj_camp_planner.formation_menu_destroy();
				states.queue(State.camp_free);
			}
			break;
	}
}