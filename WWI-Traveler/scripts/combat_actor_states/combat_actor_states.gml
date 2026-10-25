function state_actor_idle(_event) {
	switch(_event) {
		case Event.enter:
			sprite_index = my_combatant.my_sprites.idle;
			break;
	}
}

// Melee attack combat action animation
function state_actor_attack_melee(_event) {
	switch(_event) {
		case Event.enter:
			sprite_index = my_combatant.my_sprites.attack_melee;
			break;
		case Event.step:
			if (states.timer >= 30)
				states.queue(State.combat_idle);
			break;
		case Event.final:
			signal_raise(Signal_Type.on_combat_action_done, cutscene_action);
			break;
	}
}

// Ranged attack combat action animation
function state_actor_attack_ranged(_event) {
	switch(_event) {
		case Event.enter:
			sprite_index = my_combatant.my_sprites.attack_ranged;
			break;
		case Event.step:
			if (states.timer >= 30)
				states.queue(State.combat_idle);
			break;
		case Event.final:
			signal_raise(Signal_Type.on_combat_action_done, cutscene_action);
			break;
	}
}

// Move combat action animation
function state_actor_move(_event) {
	switch(_event) {
		case Event.enter:
			sprite_index = my_combatant.my_sprites.idle;
			x = cutscene_action.space.x;
			y = cutscene_action.space.y;
			layer = cutscene_action.space.layer;
			update_scale();
			break;
		case Event.step:
			if (states.timer >= 30)
				states.queue(State.combat_idle);
			break;
		case Event.final:
			signal_raise(Signal_Type.on_combat_action_done, cutscene_action);
			cutscene_action = noone;
			break;
	}
}

// Hit combat action animation
function state_actor_hit(_event) {
	switch(_event) {
		case Event.enter:
			sprite_index = my_combatant.my_sprites.hit;
			break;
		case Event.step:
			if (states.timer mod 5 == 0)
				image_alpha = !image_alpha;
		
			// Exit state
			if (states.timer >= 40)
				states.queue(State.combat_idle);
			break;
		case Event.final:
			signal_raise(Signal_Type.on_combat_action_done, cutscene_action);
			hp_display -= cutscene_action.damage;
			image_alpha = 1;
			break;
	}
}

// Evade combat action animation
function state_actor_evade(_event) {
	switch(_event) {
		case Event.enter:
			sprite_index = my_combatant.my_sprites.evade;
			break;
		case Event.step:
			if (states.timer >= 30)
				states.queue(State.combat_idle);
			break;
		case Event.final:
			signal_raise(Signal_Type.on_combat_action_done, cutscene_action);
			break;
	}
}

// Die combat action animation
function state_actor_die(_event) {
	switch(_event) {
		case Event.enter:
			sprite_index = my_combatant.my_sprites.idle;
			break;
		case Event.step:
			if (states.timer >= 10)
				states.queue(State.combat_idle);
			break;
		case Event.final:
			signal_raise(Signal_Type.on_combat_action_done, cutscene_action);
			die();
			break;
	}
}