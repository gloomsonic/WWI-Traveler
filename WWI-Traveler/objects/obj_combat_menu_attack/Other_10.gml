///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	instance_destroy(par_combat_menu);
	
	// Spawn buttons to select enemy combatants
	var _valid_targets = combatant_get_targets(my_combatant);
	for (var i = 0; i < array_length(_valid_targets); i++) {
		var _combatant = _valid_targets[i];
		instance_create_depth(0, 0, depth, obj_combat_select_enemy, {
			my_combatant: _combatant,
			callback: callback,
		});
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