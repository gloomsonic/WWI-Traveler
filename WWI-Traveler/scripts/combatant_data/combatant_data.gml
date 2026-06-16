enum Combatant_Team {player, enemy}

// Combatant data constructor to be given to obj_turn_manager
function combatant_data(_cpu, _team, _line, _pos, _hp, _damage) constructor {
	cpu = _cpu;
	team = _team;
	line = _line;
	pos = _pos;
	hp = _hp;
	damage = _damage;
}