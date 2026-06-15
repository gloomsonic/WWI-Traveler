enum Combatant_Team {player, enemy}

// Combatant data constructor to be given to obj_turn_manager
function combatant_data(_cpu, _team, _pos, _hp, _damage) constructor {
	cpu = _cpu;
	team = _team;
	pos = _pos;
	hp = _hp;
	damage = _damage;
}