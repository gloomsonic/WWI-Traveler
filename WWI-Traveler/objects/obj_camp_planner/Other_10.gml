///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	instance_create_depth(ROOM_W_H, ROOM_H_H, depth, obj_camp_formation_menu);
	camp_state_set(Camp_State.planner);
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