global.data = {};

// Stores 'keys' referring to the player's current map location and prior locations, as an [x,y] array
global.data.map_location_keys_visited = [];

// Array of arrays holding player's combatant party


#macro PARTY global.data.party
PARTY = [
	new combatant_data(false, Combatant_Team.player, 0, 0, 10, "Big Stooge", spr_combatant_idle, new weapon(3, 0.80)),
	new combatant_data(false, Combatant_Team.player, 0, 1, 10, "William Hardy", spr_combatant_idle, new weapon(3, 0.80)),
	new combatant_data(false, Combatant_Team.player, 0, 2, 9, "John-o Reardon", spr_combatant_idle, new weapon(3, 0.80)),
	new combatant_data(false, Combatant_Team.player, 1, 1, 9, "Vikram Mamar", spr_combatant_idle, new weapon(3, 0.80)),
];

#macro ENEMY_PARTY global.data.enemy_party
ENEMY_PARTY = [
	new combatant_data(true, Combatant_Team.enemy, 0, 0, 6, "George Perdy", spr_combatant_idle, new weapon(3, 0.80)), 
	new combatant_data(true, Combatant_Team.enemy, 0, 1, 7, "Greene Lewell", spr_combatant_idle, new weapon(3, 0.80)),
	new combatant_data(true, Combatant_Team.enemy, 1, 1, 7, "Jean-Charles Deniau", spr_combatant_idle, new weapon(2, 0.80)), 
];


//PARTY[0] = [
//	new combatant_data(false, Combatant_Team.player, 10, "Big Stooge", spr_combatant_idle, new weapon(3, 0.80)), 
//	new combatant_data(false, Combatant_Team.player, 10, "William Hardy", spr_combatant_idle, new weapon(3, 0.80)), 
//	new combatant_data(false, Combatant_Team.player,  9, "John-o Reardon", spr_combatant_idle, new weapon(3, 0.80)), 
//];
//PARTY[1] = [
//	noone,
//	new combatant_data(false, Combatant_Team.player, 9, "Vikram Mamar", spr_combatant_idle, new weapon(3, 0.80)),
//	noone,
//];

//// Array of arrays holding enemy's combatant party
//#macro ENEMY_PARTY global.data.enemy_party
//ENEMY_PARTY = [];
//ENEMY_PARTY[0] = [
//	noone,
//	new combatant_data(true, Combatant_Team.enemy, 6, "George Perdy", spr_combatant_idle, new weapon(3, 0.80)), 
//	new combatant_data(true, Combatant_Team.enemy, 7, "Greene Lewell", spr_combatant_idle, new weapon(3, 0.80)), 
//];
//ENEMY_PARTY[1] = [
//	noone,
//	new combatant_data(true, Combatant_Team.enemy, 7, "Jean-Charles Deniau", spr_combatant_idle, new weapon(2, 0.80)), 
//	noone,
//];