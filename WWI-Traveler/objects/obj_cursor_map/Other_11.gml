///@desc states
event_inherited();

state_cursor_camp = function(_event) {
	switch(_event) {
		case Event.step:
			touch_object(touch_these);
			break;
	}
}