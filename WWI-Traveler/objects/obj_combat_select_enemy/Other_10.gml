event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	instance_destroy(obj_combat_select_enemy);
	combat_manager_queue_action_callback(callback, active_combatant, [my_combatant]);
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(, 0); 
			draw_set(c_gray,, fa_center, fa_middle);
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(, 1); 
			draw_set(c_black,, fa_center, fa_middle);
			
			// Draw accuracy
			draw_set(,, fa_left, fa_middle);
			if (attack_type == Attack_Type.melee)
				var _accuracy = attack_melee_get_accuracy(active_combatant.my_weapon, active_combatant, my_combatant);
			else// if (attack_type == Attack_Type.ranged)
				var _accuracy = attack_ranged_get_accuracy(active_combatant.my_weapon, active_combatant, my_combatant);
				
			draw_text(BBOX_R + 16, BBOX_Y_C, $"{_accuracy}%");
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(, 1); 
			draw_set(c_ltgray,, fa_center, fa_middle);
			
			// Draw accuracy
			draw_set(,, fa_left, fa_middle);
			if (attack_type == Attack_Type.melee)
				var _accuracy = attack_melee_get_accuracy(active_combatant.my_weapon, active_combatant, my_combatant);
			else// if (attack_type == Attack_Type.ranged)
				var _accuracy = attack_ranged_get_accuracy(active_combatant.my_weapon, active_combatant, my_combatant);
			draw_text(BBOX_R + 16, BBOX_Y_C, $"{_accuracy}%");			
			break;
	}
}