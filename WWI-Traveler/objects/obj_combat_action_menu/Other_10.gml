///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
}
on_released = function() {
	obj_mouse_cursor.states.queue(State.select_target);
	instance_destroy();
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			draw_self_ext(); 
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			draw_self_ext(,,,,,,, c_blue); 
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			draw_self_ext(,,,,,,, c_red); 
			break;
	}
}