///@desc states
state_cursor_template = function(_event) {
	switch(_event) {
		case Event.step:
			touch_object(par_touchable);
			break;
	}
}