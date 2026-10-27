function combat_callback_on_attack_melee_selected(_active_combatant) {
	combat_menu_destroy();
	var _valid_targets = combatant_get_targets(_active_combatant);
	for (var i = 0; i < array_length(_valid_targets); i++) {
		var _combatant = _valid_targets[i];
		instance_create_depth(0, 0, depth, obj_combat_select_enemy, {
			my_combatant: _combatant,
			active_combatant: _active_combatant,
			callback: combat_callback_attack_melee,
			attack_type: Attack_Type.melee,
		});
	}	
	instance_create_depth(0, 0, depth, obj_combat_select_back, {
		active_combatant: _active_combatant,
	});	
}

function combat_callback_on_attack_ranged_selected(_active_combatant) {
	combat_menu_destroy();
	var _valid_targets = combatant_get_targets(_active_combatant);
	for (var i = 0; i < array_length(_valid_targets); i++) {
		var _combatant = _valid_targets[i];
		instance_create_depth(0, 0, depth, obj_combat_select_enemy, {
			my_combatant: _combatant,
			active_combatant: _active_combatant,
			callback: combat_callback_attack_ranged,
			attack_type: Attack_Type.ranged,
		});
	}
	instance_create_depth(0, 0, depth, obj_combat_select_back, {
		active_combatant: _active_combatant,
	});	
}

function combat_callback_on_move_selected(_active_combatant) {
	combat_menu_destroy();
	for (var r = 0; r < 2; r++) { // Front -> Back
		for (var c = 0; c < 3; c++) { // Left -> Center -> Right
			instance_create_depth(0, 0, depth, obj_combat_select_move, {
				row: r,
				col: c,
				my_combatant: combatant_get_at_position(r, c),
				active_combatant: _active_combatant,
				callback: combat_callback_move,
			});
		}
	}	
	instance_create_depth(0, 0, depth, obj_combat_select_back, {
		active_combatant: _active_combatant,
	});		
}