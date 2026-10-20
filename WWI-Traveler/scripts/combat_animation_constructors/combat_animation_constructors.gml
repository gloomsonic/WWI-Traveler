// Melee attack animation
function cutscene_attack(_attacker, _target) constructor {
	attacker = _attacker;
	target = _target;
	lanes = [_attacker, _target];
	inst = combatant_get_actor(_attacker);

	// Increment animation object
	update = function() {
		var _done = inst.update_attack_melee();
		if (_done) inst.reset();
		return _done;
	}
}

// Hit by an attack animation
function cutscene_hit(_target, _damage) constructor {
	target = _target;
	damage = _damage;
	lanes = [_target];
	inst = combatant_get_actor(_target);

	// Increment or destroy animation object
	update = function() {
		var _done = inst.update_hit();
		if (_done) inst.reset();
		return _done;
	}
}

// Ranged attack animation
function cutscene_attack_ranged(_attacker, _target) constructor {
	attacker = _attacker;
	target = _target;
	lanes = [_attacker, _target];
	inst = combatant_get_actor(_attacker);

	// Increment animation object
	update = function() {
		var _done = inst.update_attack_ranged();
		if (_done) inst.reset();
		return _done;
	}
}

// Repositioning animation
function cutscene_move(_combatant, _space) constructor {
	combatant = _combatant;
	lanes = [_combatant];
	space = _space;
	inst = combatant_get_actor(_combatant);

	// Increment or destroy animation object
	update = function() {
		var _done = inst.update_move(space);
		if (_done) inst.reset();
		return _done;
	}
}

// Death animation
function cutscene_die(_combatant) constructor {
	combatant = _combatant;
	lanes = [_combatant];
	inst = combatant_get_actor(_combatant);

	// Increment or destroy animation object
	update = function() {
		var _done = inst.update_die();
		if (_done) inst.die();
		return _done;
	}
}