// Melee attack animation
function cutscene_attack(_attacker, _target) constructor {
	attacker = _attacker;
	target = _target;
	lanes = [_attacker, _target];
	
	inst = combatant_get_actor(_attacker);
	inst.sprite_index = inst.my_combatant.my_sprites.attack; 
	
	// Increment animation object
	update = function() {
		var _done = inst.update();
		if (_done) inst.reset();
		return _done;
	}
}

// Hit by an attack animation
function cutscene_hit(_target, _damage) constructor {
	target = _target;
	damage = _damage;
	lanes = [_target];
	inst = noone;
	
	// Find actor with supplied target combatant //// at supplied hit combatant's position
	with (obj_combat_actor) {
		if (my_combatant != other.target) continue;
		other.inst = id;
		break;
	}
	inst.sprite_index = inst.my_combatant.my_sprites.hit;
	
	// Increment or destroy animation object
	update = function() {
		var _done = inst.update();
		if (_done) inst.reset();
		return _done;
	}
}

// Ranged attack animation
function cutscene_attack_ranged(_attacker, _target) constructor {
	attacker = _attacker;
	target = _target;
	lanes = [_attacker, _target];
	inst = noone;
	
	// Find actor at supplied attacker's position
	with (obj_combat_actor) {
		if (my_combatant != other.attacker) continue;
		other.inst = id;
		break;
	}
	inst.sprite_index = inst.my_combatant.my_sprites.attack_ranged;
	
	// Increment animation object
	update = function() {
		var _done = inst.update();
		if (_done) inst.reset();
		return _done;
	}
}

// Repositioning animation
function cutscene_move(_combatant, _space) constructor {
	combatant = _combatant;
	lanes = [_combatant];
	inst = noone;
	space = _space;
	
	// Find actor at supplied mover's position
	with (obj_combat_actor) {
		if (my_combatant != other.combatant) continue;
		other.inst = id;
		break;
	}
	
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
	inst = noone;
	
	// Find actor at supplied dying combatant's position
	with (obj_combat_actor) {
		if (my_combatant != other.combatant) continue;
		other.inst = id;
		break;
	}
	
	// Increment or destroy animation object
	update = function() {
		var _done = inst.update();
		if (_done) inst.die();
		return _done;
	}
}