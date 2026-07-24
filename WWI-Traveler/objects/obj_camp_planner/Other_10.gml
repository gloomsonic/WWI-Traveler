///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	// TODO: create instance of party manager
	instance_create_depth(ROOM_W_H, ROOM_H_H, depth, obj_camp_formation_menu);
	obj_cursor_camp.states.queue(State.camp_formation); // NOTE: could be an 'event' to which the cursor has its own callbacks, if this gets too spaghetti
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