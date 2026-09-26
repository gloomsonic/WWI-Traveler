///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	if (!can_shoot) return;
	callback();
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.draw: 
			image_blend = c_white;
			draw_set(c_gray,, fa_center, fa_middle);
			if (!can_shoot) {
				image_blend = c_ltgray;
				draw_set(c_gray,, fa_center, fa_middle)
			}
			draw_self_ext(); 
			draw_text(x, y, $"{text}: {my_combatant.my_weapon.ammo_remaining}");
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.draw: 
			image_blend = c_white;
			draw_set(c_black,, fa_center, fa_middle);
			if (!can_shoot) {
				image_blend = c_ltgray;
				draw_set(c_gray,, fa_center, fa_middle)
			}		
			draw_self_ext(); 
			draw_text(x, y, $"{text}: {my_combatant.my_weapon.ammo_remaining}");
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.draw: 
			image_blend = c_white;
			draw_set(c_black,, fa_center, fa_middle);
			if (!can_shoot) {
				image_blend = c_ltgray;
				draw_set(c_gray,, fa_center, fa_middle)
			}		
			draw_self_ext(); 
			draw_text(x, y, $"{text}: {my_combatant.my_weapon.ammo_remaining}");
			break;
	}
}