global.data = {};

// Stores 'keys' referring to the player's current map location and prior locations, as an [x,y] array
global.data.map_location_keys_visited = [];

// Array of arrays holding player's combatant party
#macro PARTY global.data.party
PARTY = [
	new combatant_data(false, Combatant_Team.player, Combatant_Row.front, 0, 10, "Big Stooge", spr_combatant_idle, GUN),
	new combatant_data(false, Combatant_Team.player, Combatant_Row.front, 1, 10, "William Hardy", spr_combatant_idle, GUN),
	new combatant_data(false, Combatant_Team.player, Combatant_Row.front, 2, 9, "John-o Reardon", spr_combatant_idle, GUN),
//	new combatant_data(false, Combatant_Team.player, Combatant_Row.back, 0, 9, "Vikram Mamar", spr_combatant_idle, GUN),
	new combatant_data(false, Combatant_Team.player, Combatant_Row.back, 1, 9, "Vikram Mamar", spr_combatant_idle, GUN),
//	new combatant_data(false, Combatant_Team.player, Combatant_Row.back, 2, 9, "Vikram Mamar", spr_combatant_idle, GUN),
];

#macro ENEMY_PARTY global.data.enemy_party
ENEMY_PARTY = [
	new combatant_data(true, Combatant_Team.enemy, Combatant_Row.front, 0, 6, "George Perdy", spr_combatant_idle, GUN), 
	new combatant_data(true, Combatant_Team.enemy, Combatant_Row.front, 1, 7, "Greene Lewell", spr_combatant_idle, GUN),
//	new combatant_data(true, Combatant_Team.enemy, Combatant_Row.front, 2, 7, "Whomst Whatsit", spr_combatant_idle, GUN), 
//	new combatant_data(true, Combatant_Team.enemy, Combatant_Row.back, 0, 7, "Whomst Whatsit", spr_combatant_idle, GUN), 
	new combatant_data(true, Combatant_Team.enemy, Combatant_Row.back, 1, 7, "Jean-Charles Deniau", spr_combatant_idle, GUN), 
	new combatant_data(true, Combatant_Team.enemy, Combatant_Row.back, 2, 7, "Whomst Whatsit", spr_combatant_idle, GUN), 
];

// Weapons
#macro GUN new weapon(2, 90, 6, 50)