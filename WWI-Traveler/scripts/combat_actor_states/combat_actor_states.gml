function state_actor_idle(_event) {
	switch(_event) {
		case Event.enter:
			sprite_index = my_combatant.my_sprites.idle;
			break;
		case Event.step:
			break;
	}
}

function state_actor_attack_melee(_event) {
	switch(_event) {
		case Event.enter:
			sprite_index = my_combatant.my_sprites.attack_melee;
			break;
		case Event.step:
			if (states.timer > 30)
				states.queue(State.combat_idle);
			break;
		case Event.final:
			signal_raise(Signal_Type.on_combat_action_done, id);
			break;
	}
}

function state_actor_attack_ranged(_event) {
	switch(_event) {
		case Event.enter:
			sprite_index = my_combatant.my_sprites.attack_ranged;
			break;
		case Event.step:
			if (states.timer > 30)
				states.queue(State.combat_idle);
			break;
		case Event.final:
			signal_raise(Signal_Type.on_combat_action_done, id);
			break;
	}
}

function state_actor_move(_event) {
	switch(_event) {
		case Event.enter:
			sprite_index = my_combatant.my_sprites.idle;
			break;
		case Event.step:
			if (states.timer > 30)
				states.queue(State.combat_idle);
			break;
		case Event.final:
			signal_raise(Signal_Type.on_combat_action_done, id);
			break;
	}
}

function state_actor_hit(_event) {
	switch(_event) {
		case Event.enter:
			sprite_index = my_combatant.my_sprites.hit;
			break;
		case Event.step:
			if (states.timer mod 5 == 0)
				image_alpha = !image_alpha;
		
			// Exit state
			if (states.timer > 30)
				states.queue(State.combat_idle);
			break;
		case Event.final:
			signal_raise(Signal_Type.on_combat_action_done, id);
			image_alpha = 1;
			break;
	}
}

function state_actor_die(_event) {
	switch(_event) {
		case Event.enter:
			sprite_index = my_combatant.my_sprites.idle;
			break;
		case Event.step:
			if (states.timer > 30)
				states.queue(State.combat_idle);
			break;
		case Event.final:
			signal_raise(Signal_Type.on_combat_action_done, id);
			break;
	}
}