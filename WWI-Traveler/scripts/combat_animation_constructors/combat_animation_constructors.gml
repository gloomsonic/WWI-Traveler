// Melee attack animation
function cutscene_attack_melee(_attacker, _target, _sfx = noone) constructor {
	attacker = _attacker;
	target = _target;
	lanes = [0]; //[_attacker, _target];
	actor = combatant_get_actor(_attacker);
	state = State.combat_attack_melee;
	sfx = _sfx;
}

// Ranged attack animation
function cutscene_attack_ranged(_attacker, _target, _sfx = noone) constructor {
	attacker = _attacker;
	target = _target;
	lanes = [0]; //[_attacker, _target];
	actor = combatant_get_actor(_attacker);
	state = State.combat_attack_ranged;
	sfx = _sfx;
}

// Repositioning animation
function cutscene_move(_combatant, _space, _sfx = noone) constructor {
	combatant = _combatant;
	space = _space;	
	lanes = [0]; //[_combatant];
	actor = combatant_get_actor(_combatant);
	state = State.combat_move;
	sfx = _sfx;
}

// Hit by an attack animation
function cutscene_hit(_target, _damage, _sfx = noone) constructor {
	target = _target;
	damage = _damage;
	lanes = [0]; //[_target];
	actor = combatant_get_actor(_target);
	state = State.combat_hit;
	sfx = _sfx;
}

// Evaded an attack animation
function cutscene_evade(_target, _sfx = noone) constructor {
	target = _target;
	lanes = [0]; //[_target];
	actor = combatant_get_actor(_target);
	state = State.combat_evade;
	sfx = _sfx;
}

// Death animation
function cutscene_die(_combatant, _sfx = noone) constructor {
	combatant = _combatant;
	lanes = [0]; //[_combatant];
	actor = combatant_get_actor(_combatant);
	state = State.combat_die;
	sfx = _sfx;
}