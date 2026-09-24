event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	instance_destroy(obj_combat_select_enemy);
	callback(my_combatant);
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(); 
			draw_set(c_gray,, fa_center, fa_middle);
			draw_text(x, y, $"{my_combatant.name}: {my_combatant.hp}");
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(); 
			draw_set(c_black,, fa_center, fa_middle);
			draw_text(x, y, $"{my_combatant.name}: {my_combatant.hp}");
			
			// Draw accuracy
			draw_set(,, fa_left, fa_middle);
			var _accuracy = attack_melee_get_accuracy(attacker.my_weapon, my_combatant.row);
			if (attack_type == Attack_Type.ranged)
				_accuracy = attacker.my_weapon.accuracy_ranged;
				
			draw_text(bbox_right + 16, y, $"{_accuracy}");
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(); 
			draw_set(c_ltgray,, fa_center, fa_middle);
			draw_text(x, y, $"{my_combatant.name}: {my_combatant.hp}");
			
			// Draw accuracy
			draw_set(,, fa_left, fa_middle);
			var _accuracy = attack_melee_get_accuracy(attacker.my_weapon, my_combatant.row);
			if (attack_type == Attack_Type.ranged)
				_accuracy = attacker.my_weapon.accuracy_ranged;
			draw_text(bbox_right + 16, y, $"{_accuracy}");			
			break;
	}
}