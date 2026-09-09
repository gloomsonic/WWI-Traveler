///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	instance_destroy(par_combat_menu);
	
	// Spawn buttons to select a position to move to
	for (var r = 0; r < 2; r++) {
		for (var c = 0; c < 3; c++) {
			instance_create_depth(0, 0, depth, obj_combat_select_move, {
				row: r,
				col: c,
				my_combatant: combatant_get_at_position(r, c),
				callback: callback,
			})
		}
	}	
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