enum Combatant_Team {player, enemy}

// Combatant data constructor to be given to obj_turn_manager
function combatant_data(_cpu, _team, _pos) constructor {
	cpu = _cpu;
	team = _team;
	pos = _pos;
}