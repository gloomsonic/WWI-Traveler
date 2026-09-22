//
function cutscene_attack(_attacker, _target) constructor {
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
	inst.sprite_index = spr_combatant_attack;
	
	// Increment animation object
	update = function() {
		var _done = inst.update();
		if (_done) inst.reset();
		return _done;
	}
}

//
function cutscene_hit(_target, _damage) constructor {
	target = _target;
	damage = _damage;
	lanes = [_target];
	inst = noone;
	
	// Find actor at supplied target's position
	with (obj_combat_actor) {
		if (my_combatant != other.target) continue;
		other.inst = id;
		break;
	}
	inst.sprite_index = spr_combatant_guard;	
	
	// Increment or destroy animation object
	update = function() {
		var _done = inst.update();
		if (_done) inst.reset();
		return _done;
	}
}

//
function cutscene_die(_combatant) constructor {
	combatant = _combatant;
	lanes = [_combatant];
	inst = noone;
	
	// Find actor at supplied target's position
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