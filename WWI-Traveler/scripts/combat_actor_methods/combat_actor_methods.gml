function combat_actor_methods() {
	
	// Default update method for 'cutscene' actions
	update = function() {
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

	// Reset timer/sprite for cutscene actions
	reset = function() {
		sprite_index = my_combatant.my_sprites.idle;
		timer = 0
	}

	// Destroy self
	die = function() {
		instance_destroy();
	}

	// Set image_x/yscale by combatant's team/row
	update_scale = function() {
		if (my_combatant.team == Combatant_Team.player) {
			if (my_combatant.row == Combatant_Row.back) {
				image_xscale = PARTY_SCALE_R1;
				image_yscale = PARTY_SCALE_R1;
				image_blend = PARTY_BLEND_R1;
			}
			if (my_combatant.row == Combatant_Row.front) {
				image_xscale = PARTY_SCALE_R0;
				image_yscale = PARTY_SCALE_R0;	
				image_blend = PARTY_BLEND_R0;
			}	
		} else {
			if (my_combatant.row == Combatant_Row.front) {
				image_xscale = ENEMY_SCALE_R0;
				image_yscale = ENEMY_SCALE_R0;	
				image_blend = ENEMY_BLEND_R0;
			}		
			if (my_combatant.row == Combatant_Row.back) {
				image_xscale = ENEMY_SCALE_R1;
				image_yscale = ENEMY_SCALE_R1;		
				image_blend = ENEMY_BLEND_R1;
			}
		}
	}
}