global.data = {};

// Array of arrays holding player's combatant party
global.data.party = [];
global.data.party[0] = [
	new combatant_data(false, Combatant_Team.player, 10, "Big Stooge", new weapon(3, 0.80)), 
	new combatant_data(false, Combatant_Team.player, 10, "William Hardy", new weapon(3, 0.80)), 
	new combatant_data(false, Combatant_Team.player,  9, "John-o Reardon", new weapon(3, 0.80)), 
	noone,
];
global.data.party[1] = [
	noone,
	new combatant_data(false, Combatant_Team.player, 9, "Vikram Mamar", new weapon(3, 0.80)),
	noone,
];

// Stores 'keys' referring to the player's current map location and prior locations, as an [x,y] array
global.data.map_location_keys_visited = [];