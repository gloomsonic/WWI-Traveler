///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	if (active_combatant.inventory.bullets <= 0) return;
	combat_manager_queue_action_callback(callback, active_combatant);
	combat_menu_destroy();
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_set(, fnt_droid_serif_48, fa_center, fa_middle);
			if (can_reload)
				draw_text_solid_color(x, y, text, c_gray);	
			else
				draw_text_solid_color(x, y, text, c_dkgray);	
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_set(, fnt_droid_serif_48, fa_center, fa_middle);
			draw_text_solid_color(x, y, text, c_white);	
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_set(, fnt_droid_serif_48, fa_center, fa_middle);
			draw_text_solid_color(x, y, text, c_ltgray);	
			break;
	}
}