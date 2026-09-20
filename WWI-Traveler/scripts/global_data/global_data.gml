global.data = {};

// Stores 'keys' referring to the player's current map location and prior locations, as an [x,y] array
global.data.map_location_keys_visited = [];

// Array of arrays holding player's combatant party
#macro PARTY global.data.party
PARTY = [
	new combatant_data(false, Combatant_Team.player, 0, 0, 10, "Big Stooge", spr_combatant_idle, GUN),
	new combatant_data(false, Combatant_Team.player, 0, 1, 10, "William Hardy", spr_combatant_idle, GUN),
	new combatant_data(false, Combatant_Team.player, 0, 2, 9, "John-o Reardon", spr_combatant_idle, GUN),
	new combatant_data(false, Combatant_Team.player, 1, 1, 9, "Vikram Mamar", spr_combatant_idle, GUN),
];

#macro ENEMY_PARTY global.data.enemy_party
ENEMY_PARTY = [
	new combatant_data(true, Combatant_Team.enemy, 0, 0, 6, "George Perdy", spr_combatant_idle,	GUN), 
	new combatant_data(true, Combatant_Team.enemy, 0, 1, 7, "Greene Lewell", spr_combatant_idle, GUN),
	new combatant_data(true, Combatant_Team.enemy, 1, 1, 7, "Jean-Charles Deniau", spr_combatant_idle, GUN), 
	new combatant_data(true, Combatant_Team.enemy, 1, 2, 7, "Whomst Whatsit", spr_combatant_idle, GUN), 
];

//// Positions at which to spawn combat actors
//#macro COMBAT_POS global.combat_positions
//COMBAT_POS = [
//	{x: 400, y: 1080, team: Combatant_Team.player, row: 1, col: 0},
//];

// Weapons
#macro GUN new weapon(2, 90, 6, 50)