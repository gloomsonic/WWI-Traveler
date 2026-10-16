///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	var _active = obj_camp_formation_menu.get_active_space();
	if (_active == noone)
		obj_camp_formation_menu.set_active_space(id);
	else 
		obj_camp_formation_menu.spaces_trade_combatants(_active, id);
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
		
			// Choose color
			var _c = c_white;
			if (obj_camp_formation_menu.get_active_space() == id)
				_c = c_lime;
				
			// Draw combatant space/name	
			draw_set(_c);
			draw_self_ext(,,,,,,, _c);
			if (my_combatant != noone)
				draw_text(x, y, my_combatant.name);
			else
				draw_text(x, y, "noone");
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
		
			// Choose color
			var _c = c_blue;
			if (obj_camp_formation_menu.get_active_space() == id)
				_c = c_lime;
			draw_set(_c);
			
			// Draw combatant space/name
			draw_self_ext(,,,,,,, _c);
			if (my_combatant != noone)
				draw_text(x, y, my_combatant.name);
			else
				draw_text(x, y, "noone");		
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
		
			// Choose color
			var _c = c_red;
			if (obj_camp_formation_menu.get_active_space() == id)
				_c = c_lime;
	
			// Draw combatant space/name
			draw_set(_c);
			draw_self_ext(,,,,,,, _c);
			if (my_combatant != noone)
				draw_text(x, y, my_combatant.name);
			else
				draw_text(x, y, "noone");		
			break;
	}
}