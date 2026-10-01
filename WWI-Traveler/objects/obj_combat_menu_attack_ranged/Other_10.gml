///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	callback();
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_set(, fnt_droid_serif_48, fa_center, fa_middle);
			draw_text_solid_color(x, y, $"{text}: {my_combatant.my_weapon.ammo_remaining}", c_gray);			
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_set(, fnt_droid_serif_48, fa_center, fa_middle);
			draw_text_solid_color(x, y, $"{text}: {my_combatant.my_weapon.ammo_remaining}", c_white);				
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_set(, fnt_droid_serif_48, fa_center, fa_middle);
			draw_text_solid_color(x, y, $"{text}: {my_combatant.my_weapon.ammo_remaining}", c_ltgray);				
			break;
	}
}