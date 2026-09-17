enum Combatant_Team {player, enemy}

// Combatant data constructor to be given to obj_turn_manager
function combatant_data(_cpu, _team, _row, _col, _hp, _name, _sprite, _weapon) constructor {
	cpu = _cpu;
	team = _team;
	row = _row;
	col = _col;
	hp = _hp;
	name = _name;
	sprite_index = _sprite;
	my_weapon = _weapon;
}

function weapon(_damage_melee, _accuracy_melee, _damage_ranged, _accuracy_ranged) constructor {
	damage_melee = _damage_melee;
	accuracy_melee = _accuracy_melee;
	damage_ranged = _damage_ranged;
	accuracy_ranged = _accuracy_ranged;
	ammo_max = 1;
}

//
function cutscene_attack(_attacker, _target) constructor {
	attacker = _attacker;
	target = _target;
	lanes = [_attacker, _target];
	inst = noone;
	
	update = function() {
		if (!instance_exists(inst))
			inst = instance_create_depth(ROOM_W_H, ROOM_H_H, 0, obj_combat_animation, {
				sprite_index: spr_combatant_attack,
			});
		var _done = inst.update();
		if (_done) instance_destroy(inst);	
		return _done;
	}
}

function cutscene_hit(_target, _damage) constructor {
	target = _target;
	damage = _damage;
	lanes = [_target];
	inst = noone;
	
	update = function() {
		if (!instance_exists(inst))
			inst = instance_create_depth(ROOM_W_H, ROOM_H_H, 0, obj_combat_animation, {
				sprite_index: spr_combatant_guard,
			});
		var _done = inst.update();
		if (_done) instance_destroy(inst);	
		return _done;
	}
}