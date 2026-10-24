// Melee attack animation
function cutscene_attack(_attacker, _target) constructor {
	attacker = _attacker;
	target = _target;
	lanes = [_attacker, _target];
	actor = combatant_get_actor(_attacker);
	state = State.combat_attack_melee;
}

// Ranged attack animation
function cutscene_attack_ranged(_attacker, _target) constructor {
	attacker = _attacker;
	target = _target;
	lanes = [_attacker, _target];
	actor = combatant_get_actor(_attacker);
	state = State.combat_attack_ranged;
}

// Repositioning animation
function cutscene_move(_combatant, _space) constructor {
	combatant = _combatant;
	space = _space;	
	lanes = [_combatant];
	actor = combatant_get_actor(_combatant);
	state = State.combat_move;
}

// Hit by an attack animation
function cutscene_hit(_target, _damage) constructor {
	target = _target;
	damage = _damage;
	lanes = [_target];
	actor = combatant_get_actor(_target);
	state = State.combat_hit;
}

// Death animation
function cutscene_die(_combatant) constructor {
	combatant = _combatant;
	lanes = [_combatant];
	actor = combatant_get_actor(_combatant);
	state = State.combat_die;
}