enum Combatant_Team {player, enemy}
enum Combatant_Row {front, back}
enum Combatant_Col {left, center, right}

// Combatant data constructor to be given to obj_turn_manager
function combatant_data(_cpu, _team, _row, _col, _hp, _spd, _name, _sprites, _weapon) constructor {
	cpu = _cpu;
	team = _team;
	row = _row;
	col = _col;
	hp = _hp;
	spd = _spd;
	name = _name;
	my_sprites = _sprites;
	my_weapon = _weapon;
	
	inventory = {
		bullets: 1,
	}
}

function combatant_sprites(_idle, _attack_melee, _attack_ranged, _hit, _evade) constructor {
	idle = _idle;
	attack_melee = _attack_melee;
	attack_ranged = _attack_ranged;
	hit = _hit;
	evade = _evade;
}

// Scales to set combat actors to based on their team/row
#macro PARTY_SCALE_R1 1.60
#macro PARTY_BLEND_R1 make_colour_rgb(255, 255, 255)
#macro PARTY_SCALE_R0 1.30
#macro PARTY_BLEND_R0 make_colour_rgb(235, 235, 235)
#macro ENEMY_SCALE_R0 0.90
#macro ENEMY_BLEND_R0 make_colour_rgb(215, 215, 215)
#macro ENEMY_SCALE_R1 0.65
#macro ENEMY_BLEND_R1 make_colour_rgb(195, 195, 195)