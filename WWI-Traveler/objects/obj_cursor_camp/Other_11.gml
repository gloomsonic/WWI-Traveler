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
			touch_object(obj_camp_formation_space); // TODO: make object that this will actually touch
			break;
	}
}