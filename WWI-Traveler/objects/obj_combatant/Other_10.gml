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
			draw_self_ext(); 
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(,,,,,,, c_blue); 
			break;
	} 
}

state_held = function(_event) {
	switch(_event) {
		case Event.draw: 
			draw_self_ext(,,,,,,, c_red); 
			break;
	}
}

// Non-standard state
state_flash = function(_event) {
	switch(_event) {
		case Event.enter:
			ignore_cursor = true;
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
			break;
	}
}

state_attack = function(_event) {
	switch(_event) {
		case Event.enter:
			ignore_cursor = true;
			sprite_index = spr_combatant_attack;
			image_index = 0;
			break;
			
		case Event.step: 
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