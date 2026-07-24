enum Combatant_Team {player, enemy}

// Combatant data constructor to be given to obj_turn_manager
function combatant_data(_cpu, _team, _hp, _damage, _name) constructor {
	cpu = _cpu;
	team = _team;
	hp = _hp;
	damage = _damage;
	name = _name;
}

function combatant_space(_xpercent, _ypercent) constructor {
	x = _xpercent * ROOM_W;
	y = _ypercent * ROOM_H;
}