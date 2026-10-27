function combat_callback_attack_melee(_active_combatant, _target) {
	array_push(combat_log, $"{_active_combatant.name} attacked {_target.name}");
	obj_combat_animation_manager.add_action(new cutscene_attack_melee(_active_combatant, _target));
	
	// Roll to hit
	var _weapon = _active_combatant.my_weapon;
	var _accuracy = attack_melee_get_accuracy(_weapon, _active_combatant, _target);
	var _roll = irandom(100);
	
	// Execute and log hit
	if (_roll <= _accuracy) {
		var _damage = _weapon.damage_melee;
		_target.hp -= _damage;
		obj_combat_animation_manager.add_action(new cutscene_hit(_target, _damage, EV_PUNCH));
		array_push(combat_log, $"{_target.name} took {_damage} damage");
	} else {
		obj_combat_animation_manager.add_action(new cutscene_evade(_target, EV_MISS));
		array_push(combat_log, $"{_active_combatant.name} missed");
	}

	// Check dead
	if (_target.hp <= 0) {
		obj_combat_animation_manager.add_action(new cutscene_die(_target));
		array_push(combat_log, $"{_target.name} died");
	}

	// Ask combat manager to tell us when it's done
	instance_destroy(obj_combat_select_back);
}

function combat_callback_attack_ranged(_active_combatant, _target) {
	array_push(combat_log, $"{_active_combatant.name} shot {_target.name}");
	obj_combat_animation_manager.add_action(new cutscene_attack_ranged(_active_combatant, _target, EV_GUNSHOT));
	
	// Roll to hit
	var _weapon = _active_combatant.my_weapon;
	var _accuracy = attack_ranged_get_accuracy(_weapon, _active_combatant, _target);
	var _roll = irandom(100);
	_weapon.ammo_remaining -= 1;
	
	// Execute and log hit
	if (_roll <= _accuracy) {
		var _damage = _weapon.damage_ranged;
		_target.hp -= _damage;
		obj_combat_animation_manager.add_action(new cutscene_hit(_target, _damage, EV_BULLET_HIT));
		array_push(combat_log, $"{_target.name} took {_damage} damage");
	} else {
		obj_combat_animation_manager.add_action(new cutscene_evade(_target, EV_BULLET_MISS));
		array_push(combat_log, $"{_active_combatant.name} missed");
	}

	// Check dead
	if (_target.hp <= 0) {
		obj_combat_animation_manager.add_action(new cutscene_die(_target));
		array_push(combat_log, $"{_target.name} died");
	}
	
	// Ask combat manager to tell us when it's done
	instance_destroy(obj_combat_select_back);
}

function combat_callback_move(_active_combatant, _row, _col) {
	var _other_combatant = combatant_get_at_position(_row, _col);
	
	var _row_prev = _active_combatant.row;
	var _col_prev = _active_combatant.col;
	
	// Move active combatant
	_active_combatant.row = _row;
	_active_combatant.col = _col;
	array_push(combat_log, $"{_active_combatant.name} moved to row:{_row}, col:{_col}");	
	var _space = combat_space_get_at_position(_active_combatant.team, _row, _col); // NOTE: `_other_combatant` can be `noone,` so using '_active_combatant' to check team
	obj_combat_animation_manager.add_action(new cutscene_move(_active_combatant, _space));
	
	// If combatant already there, swap
	if (_other_combatant != noone) {
		_other_combatant.row = _row_prev;
		_other_combatant.col = _col_prev;
		array_push(combat_log, $"{_other_combatant.name} moved to row:{_row_prev}, col:{_col_prev}");
		var _space = combat_space_get_at_position(_active_combatant.team, _row_prev, _col_prev);
		obj_combat_animation_manager.add_action(new cutscene_move(_other_combatant, _space));
	}
		
	// Ask combat manager to tell us when it's done
	instance_destroy(obj_combat_select_back);
}

function combat_callback_reload(_active_combatant) {
	array_push(combat_log, $"{_active_combatant.name} reloaded");
	_active_combatant.inventory.bullets -= 1; // TODO: reloading variable number of bullets?
	_active_combatant.my_weapon.reload();
}

function combat_callback_pass(_active_combatant) {
	array_push(combat_log, $"{_active_combatant.name} passed");	
}