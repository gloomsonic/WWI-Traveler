///@desc states
event_inherited();

state_cursor_story_choose = function(_event) {
	switch(_event) {
		case Event.step: 
			touch_object(obj_story_choice);
			break;
	}
}