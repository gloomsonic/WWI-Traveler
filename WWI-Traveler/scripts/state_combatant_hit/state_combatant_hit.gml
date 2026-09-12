// Just hit by an attack
// - Non-standard touchable state
function state_combatant_hit(_event) {
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
			set_ready(true);
			check_dead();
			break;
	}
}