event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	instance_destroy(obj_combat_select_move);
	callback(row, col);
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(); 
			draw_set(c_gray,, fa_center, fa_middle);
			draw_text(x, y, text);
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(); 
			draw_set(c_black,, fa_center, fa_middle);
			draw_text(x, y, text);
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(); 
			draw_set(c_ltgray,, fa_center, fa_middle);
			draw_text(x, y, text);
			break;
	}
}