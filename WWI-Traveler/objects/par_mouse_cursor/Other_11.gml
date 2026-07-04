///@desc states
state_cursor_default = function(_event) {
	switch(_event) {
		case Event.step:
			touch_object(par_touchable);
			break;
	}
}