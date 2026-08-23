///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
}
on_released = function() {
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_set(,, fa_center);
			draw_self_ext(); 
			
			if (my_data != noone) {
				draw_text(SPR_X_C, SPR_T, my_data.name);
				draw_text(SPR_X_C, SPR_T - font_height(), my_data.hp);	
			}
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_set(,, fa_center);
			draw_self_ext(,,,,,,, c_blue); 
			
			if (my_data != noone) {
				draw_text(SPR_X_C, SPR_T, my_data.name);
				draw_text(SPR_X_C, SPR_T - font_height(), my_data.hp);	
			}	
			break;
	} 
}

state_held = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_set(,, fa_center);
			draw_self_ext(,,,,,,, c_red); 
			
			if (my_data != noone) {
				draw_text(SPR_X_C, SPR_T, my_data.name);
				draw_text(SPR_X_C, SPR_T - font_height(), my_data.hp);	
			}				
			break;
	}
}

// Non-standard states

// Attacking animation
state_attack = function(_event) {
	switch(_event) {
		case Event.enter:
			ignore_cursor = true;
			sprite_index = spr_combatant_attack;
			image_index = 0;
			audio_oneshot_3d(EV_PUNCH, x, y);
			break;
			
		case Event.step: 
		
			// Exit state
			if (animation_end())
				states.queue(State.idle);
			break;
			
		case Event.draw: 
			draw_self_ext(); 
			break;
			
		case Event.final:
			sprite_index = spr_combatant_idle;
			ignore_cursor = false;
			signal_ready();
			break;
	}	
}

// Just hit by an attack
state_hit = function(_event) {
	switch(_event) {
		case Event.enter:
			ignore_cursor = true;
			sprite_index = spr_combatant_idle;
			break;
			
		case Event.step: 
			if (flash_remaining mod flash_duration == 0)
				image_alpha = !image_alpha;
	
			flash_remaining = approach(flash_remaining, -1, 1);
			
			// Exit state
			if (flash_remaining <= 0)
				states.queue(State.idle);
			break;
			
		case Event.draw: 
			draw_self_ext(); 
			break;
			
		case Event.final:
			image_alpha = 1;
			ignore_cursor = false;
			signal_ready();
			if (my_data.hp <= 0) {
				signal_raise(Signal_Type.on_combatant_killed, id);
				var _data = obj_combat_manager.get_row_pos_space(my_space);
				
				// If player died, remove from global array
				if (_data.team == Combatant_Team.player)
					global.data.party[_data.row][_data.pos] = noone;
			}
			break;
	}
}

// Was just missed by an attack
state_evaded = function(_event) {
	switch(_event) {
		case Event.enter:
			ignore_cursor = true;
			sprite_index = spr_combatant_idle;
			image_index = 0;
			effect_create_depth(depth-1, ef_firework, x, BBOX_T, 1, c_green); // NOTE: This is a horrible engine default effect to be replaced
			break;
			
		case Event.step: 
		
			// Exit state
			if (animation_end())
				states.queue(State.idle);
			break;
			
		case Event.draw: 
			draw_self_ext(); 
			break;
			
		case Event.final:
			ignore_cursor = false;
			signal_ready();
			break;
	}	
}