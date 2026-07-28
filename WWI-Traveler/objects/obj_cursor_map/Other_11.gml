event_inherited();

state_cursor_map_select = function(_event) {
	switch(_event) {
		case Event.step:
			touch_object(par_touchable);
			break;
	}
}