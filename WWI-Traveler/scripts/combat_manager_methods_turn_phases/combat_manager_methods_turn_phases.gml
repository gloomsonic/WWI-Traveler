function combat_manager_methods_action_callbacks() {

	// Start the next combatant's turn
	turn_start = function() {
		active_combatant = array_shift(turn_order);
		array_push(turn_order, active_combatant);	
		var _valid_targets = combatant_get_targets(active_combatant);
	
		// CPU vs. player turn
		if (active_combatant.team == Combatant_Team.enemy) {
			var _target = array_pop(array_shuffle(_valid_targets));
			attack_melee(_target);
		} else {
			combat_menu_create();
		}
	}

	// Check if combat end or next turn
	turn_end = function() {
		var _check_dead = function(_val) {
			return _val.hp > 0;
		}
		turn_order = array_filter(turn_order, _check_dead);
		PARTY = array_filter(PARTY, _check_dead);
		ENEMY_PARTY = array_filter(ENEMY_PARTY, _check_dead);
	
		// Space for readability
		array_push(combat_log, "--------------------   ");
	
		// Next turn or end combat
		if (array_length(PARTY) <= 0) {
			array_push(combat_log, "You Died");
			room_goto(rm_game_over);
		} else if (array_length(ENEMY_PARTY) <= 0) {
			array_push(combat_log, "You Won");
			room_goto(rm_camp);
		} else
			call_next_frame(turn_start) //turn_start();
	}

	// Create the player combat options menu
	combat_menu_create = function() {
		var _ypad = 0;
		var _y = ROOM_H * 0.93;

		// Name
		instance_create_depth(ROOM_W * 0.1, _y - _ypad, depth, obj_combat_menu_label, {
			my_combatant: active_combatant,
		});
	
		// Top left and spacing for action buttons
		var _font = fnt_droid_serif_48;
		var _w = 512;
		var _h = font_height(_font) * 1.5;
		var _xpad = _w;
		var _l = ROOM_W_H - ((_xpad * 4) / 2);
		var _x = _l + (_xpad / 2); // Centered origin offset
		
		// Melee attack button
		instance_create_depth(_x, _y, depth, obj_combat_menu_attack_melee, {
			my_combatant: active_combatant,
			callback: on_attack_melee_selected,
			font: _font,
			w: _w,
			h: _h,
		});
	
		// Ranged attack button
		_x += _xpad;
		_y += _ypad;
		if (active_combatant.my_weapon.ammo_remaining > 0) {
			instance_create_depth(_x, _y, depth, obj_combat_menu_attack_ranged, {
				my_combatant: active_combatant,
				callback: on_attack_ranged_selected,
				font: _font,
				w: _w,
				h: _h,
			});
		} else {
			instance_create_depth(_x, _y, depth, obj_combat_menu_reload, {
				my_combatant: active_combatant,
				callback: reload,
				font: _font,
				w: _w,
				h: _h,
			});		
		}
	
		// Move button
		_x += _xpad;
		_y += _ypad;
		instance_create_depth(_x, _y, depth, obj_combat_menu_move, {
			my_combatant: active_combatant,
			callback: on_move_selected,
			font: _font,
			w: _w,
			h: _h,
		});
	
		// Pass button
		_x += _xpad;
		_y += _ypad;
		instance_create_depth(_x, _y, depth, obj_combat_menu_pass, {
			my_combatant: active_combatant,
			callback: pass,
			font: _font,
			w: _w,
			h: _h,
		});
	}
}