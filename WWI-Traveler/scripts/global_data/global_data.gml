global.data = {};

// Array of arrays holding player's combatant party
global.data.party = [];
global.data.party[0] = [
	new combatant_data(false, Combatant_Team.player, 10, 3, "Big Stooge"), 
	new combatant_data(false, Combatant_Team.player, 10, 3, "William Hardy"), 
	new combatant_data(false, Combatant_Team.player,  9, 2, "John-o Reardon"), 
	noone,
];
global.data.party[1] = [
	noone,
	new combatant_data(false, Combatant_Team.player, 9, 2, "Vikram Mamar"),
	noone,
];

// Stores 'keys' referring to the player's current map location and prior locations, as an [x,y] array
global.data.map_location_keys_visited = [];