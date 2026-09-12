// Attacking another combatant
// - Non-standard touchable state
function state_combatant_attack(_event) {
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
			set_ready(true);
			break;
	}	
}