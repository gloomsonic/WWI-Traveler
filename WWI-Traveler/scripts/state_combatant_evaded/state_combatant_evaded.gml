// Just missed by an attack
// - Non-standard touchable state
function state_combatant_evaded(_event) {
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
			set_ready(true);
			break;
	}	
}