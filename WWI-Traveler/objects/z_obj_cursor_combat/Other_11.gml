///@desc states
event_inherited();

state_cursor_select_action = function(_event) {
	switch(_event) {
		case Event.step: 
			touch_object(touch_these);
			break;
	}
}