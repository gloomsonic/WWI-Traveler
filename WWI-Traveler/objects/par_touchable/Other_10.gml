///@desc states

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
		case Event.step: 
			//log("idle"); 
			break;
		case Event.draw: 
			draw_self_ext(); 
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.step: 
			//log("hovered"); 
			break;
		case Event.draw: 
			draw_self_ext(); 
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.step: 
			//log("held"); 
			break;
		case Event.draw: 
			draw_self_ext(); 
			break;
	}
}