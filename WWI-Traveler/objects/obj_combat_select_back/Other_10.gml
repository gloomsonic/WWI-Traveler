///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	back();
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.step: 
			if (mouse_check_button_pressed(mb_right))
				back();
			break;
		case Event.draw: 
			draw_self_ext(); 
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.step: 
			if (mouse_check_button_pressed(mb_right))
				back();
			break;
		case Event.draw: 
			draw_self_ext(); 
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.step: 
			if (mouse_check_button_pressed(mb_right))
				back();
			break;
		case Event.draw: 
			draw_self_ext(); 
			break;
	}
}