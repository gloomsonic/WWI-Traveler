///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	ENCOUNTER_QUEUE = variable_clone(my_encounters);
	MAP_PATH_SELECTED = my_path;
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.draw: 
			if (MAP_PATH_SELECTED == my_path)
				draw_self_ext(,,,,,,, c_yellow); 
			else
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