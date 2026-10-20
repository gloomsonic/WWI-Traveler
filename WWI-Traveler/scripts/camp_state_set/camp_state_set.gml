enum Camp_State {top, planner}

// Resets what the mouse can click 
function camp_state_set(_state) {
	switch (_state) {
		case Camp_State.top:
			par_mouse_cursor.clear_touchables();
			par_mouse_cursor.add_touchable(obj_camp_map);
			par_mouse_cursor.add_touchable(obj_camp_sleep);
			par_mouse_cursor.add_touchable(obj_camp_planner);
			break;
			
		case Camp_State.planner:
			par_mouse_cursor.clear_touchables();
			par_mouse_cursor.add_touchable(obj_camp_formation_space);
			break;
	}
}