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

