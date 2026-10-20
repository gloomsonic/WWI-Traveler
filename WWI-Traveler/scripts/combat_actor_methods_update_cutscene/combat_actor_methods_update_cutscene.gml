function combat_actor_methods_update_cutscene() {

	// Update method for cutscene_attack action
	update_attack_melee = function() {
		sprite_index = my_combatant.my_sprites.attack_melee; // TODO: handle these in states, send out a signal when lane can be cleared
		timer++;
		return timer >= duration;
	}

	// Update method for cutscene_attack_ranged action
	update_attack_ranged = function() {
		sprite_index = my_combatant.my_sprites.attack_ranged;
		timer++;
		return timer >= duration;
	}

	// Update method for cutscene_move action
	update_move = function(_space) {
		timer++;
		if (timer >= duration) {
			x = _space.x;
			y = _space.y;
			layer = _space.layer;
			update_scale();
			return true;
		}
		return false;
	}
	
	// Update method for cutscene_hit action, blinking
	update_hit = function() {
		sprite_index = my_combatant.my_sprites.hit;
		timer++;
		if (timer mod 5 == 0)
			image_alpha = !image_alpha;
		if (timer >= duration) {
			image_alpha = 1;
			return true;
		}
		return false;	
	}
	
	// Update method for cutscene_action die
	update_die = function() {
		sprite_index = my_combatant.my_sprites.idle;
		timer++;
		return timer >= duration;
	}
}