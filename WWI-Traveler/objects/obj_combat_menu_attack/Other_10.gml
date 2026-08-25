///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
}
on_released = function() {
	obj_cursor_combat.states.queue(State.select_target);
	states.queue(State.selected);
	//destroy_combat_menu();
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

// Non-standard states
state_selected = function(_event) {
	switch(_event) {
		case Event.enter:
			ignore_cursor = true;
			break;
		case Event.step: 
			break;
		case Event.draw: 
			draw_self_ext(,,,,,,, c_blue); 
			break;
		case Event.final:
			ignore_cursor = false;
			break;
	}
}