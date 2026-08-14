enum Combatant_Team {player, enemy}

// Combatant data constructor to be given to obj_turn_manager
function combatant_data(_cpu, _team, _hp, _name, _melee, _ranged = -1) constructor {
	cpu = _cpu;
	team = _team;
	hp = _hp;
	name = _name;
	melee = _melee;
	ranged = _ranged; // TODO: decide whether an array of weapons or melee vs. ranged, probably an array but also these
}

//function combatant_space(_xpercent, _ypercent) constructor {
//	x = _xpercent * ROOM_W;
//	y = _ypercent * ROOM_H;
//}

function weapon(_damage, _accuracy) constructor {
	damage = _damage;
	accuracy = _accuracy;
}