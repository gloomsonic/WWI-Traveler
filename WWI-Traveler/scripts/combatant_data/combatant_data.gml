enum Combatant_Team {player, enemy}
enum Combatant_Row {front, back}

// Combatant data constructor to be given to obj_turn_manager
function combatant_data(_cpu, _team, _row, _col, _hp, _name, _sprites, _weapon) constructor {
	cpu = _cpu;
	team = _team;
	row = _row;
	col = _col;
	hp = _hp;
	name = _name;
	my_sprites = _sprites;
	my_weapon = _weapon;
	
	inventory = {
		bullets: 1,
	}
}

function combatant_sprites(_idle, _attack, _hit) constructor {
	idle = _idle;
	attack = _attack;
	hit = _hit;
}