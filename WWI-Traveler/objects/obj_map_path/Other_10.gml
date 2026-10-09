///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	log("released");
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.draw: 
			image_blend = c_white;
			draw_self_ext(); 	
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.draw: 
			image_blend = c_blue;
			draw_self_ext(); 
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.draw: 
			image_blend = c_red;
			draw_self_ext(); 
			break;
	}
}