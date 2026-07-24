///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	//signal_raise(Signal_Type.on_formation_space_selected);
	if (obj_cursor_camp.get_formation_space() == noone) {
		obj_cursor_camp.set_formation_space(id);
	} else {
		// NEXT: 
		// swap indeces of combatant data with my 'name' and indeces of combatant data with obj_cursor_camp's formation space's 'name' on the global.data.party arrays.
		// close and re-open the formation menu so the position change is visible
		obj_cursor_camp.set_formation_space(noone);
	}
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw:  
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			break;
	}
}