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
			draw_set();
			draw_self_ext();
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