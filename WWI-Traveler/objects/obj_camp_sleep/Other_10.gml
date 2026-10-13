///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	instance_destroy(par_mouse_cursor);
	room_transition_start(rm_map);
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(); 
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(,,,,,,, c_blue); 
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(,,,,,,, c_red); 
			break;
	}
}