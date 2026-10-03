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
		var _y = ROOM_H * 0.93;
		var _combatant = active_combatant;
		var _buttons = [];
		var _font = fnt_droid_serif_48;
		var _w = 512;
		var _h = font_height(_font) * 1.5;		
		
		// Combatant name
		instance_create_depth(ROOM_W * 0.05, _y, depth, obj_combat_menu_label, {
			my_combatant: _combatant,
		});		
		
		// Create buttons for the array
		var _new = combat_menu_button_create(_combatant, obj_combat_menu_attack_melee, _w, _h, _font, on_attack_melee_selected);
		array_push(_buttons, _new);
		if (active_combatant.my_weapon.damage_ranged != -1) {
			if (active_combatant.my_weapon.ammo_remaining > 0)
				_new = combat_menu_button_create(_combatant, obj_combat_menu_attack_ranged, _w, _h, _font, on_attack_ranged_selected);
			else
				_new = combat_menu_button_create(_combatant, obj_combat_menu_reload, _w, _h, _font, reload);
			array_push(_buttons, _new);
		}
		_new = combat_menu_button_create(_combatant, obj_combat_menu_move, _w, _h, _font, on_move_selected);
		array_push(_buttons, _new);
		_new = combat_menu_button_create(_combatant, obj_combat_menu_pass, _w, _h, _font, pass);
		array_push(_buttons, _new);
		
		// Position buttons on the array
		var _size = array_length(_buttons);
		var _l = ROOM_W_H - ((_w * _size) / 2);
		var _x = _l + (_w / 2); // Centered origin offset

		for (var i = 0; i < array_length(_buttons); i++) {
			var _button = _buttons[i];
			_button.x = _x;
			_button.y = _y;
			_x += _w;
		}
	}
}