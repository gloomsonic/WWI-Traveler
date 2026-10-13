global.data = {};

#macro ENCOUNTER_QUEUE global.data.encounter_queue
ENCOUNTER_QUEUE = [];

// Default groups of combatant sprites
#macro PLAYER_COMBAT_SPRITES global.data.player_combatant_sprites
PLAYER_COMBAT_SPRITES = new combatant_sprites(spr_combatant_player_idle, spr_combatant_attack, spr_combatant_guard);
#macro ENEMY_COMBAT_SPRITES global.data.enemy_combatant_sprites
ENEMY_COMBAT_SPRITES = new combatant_sprites(spr_combatant_idle, spr_combatant_attack, spr_combatant_guard);

#macro PARTY global.data.party
PARTY = [
	new combatant_data(false, Combatant_Team.player, Combatant_Row.front, Combatant_Col.left, 10, 0, "Big Stooge", PLAYER_COMBAT_SPRITES, GUN),
	//new combatant_data(false, Combatant_Team.player, Combatant_Row.front, 1, 10, "William Hardy", PLAYER_COMBAT_SPRITES, GUN),
	//new combatant_data(false, Combatant_Team.player, Combatant_Row.front, 2, 9, "John-o Reardon", PLAYER_COMBAT_SPRITES, GUN),
	new combatant_data(false, Combatant_Team.player, Combatant_Row.back, Combatant_Col.left, 9, 2, "Vikram Mamar", PLAYER_COMBAT_SPRITES, FIST),
	new combatant_data(false, Combatant_Team.player, Combatant_Row.back, Combatant_Col.center, 9, 5, "Vikram Mamar", PLAYER_COMBAT_SPRITES, GUN),
	new combatant_data(false, Combatant_Team.player, Combatant_Row.back, Combatant_Col.right, 9, 4, "Vikram Mamar", PLAYER_COMBAT_SPRITES, GUN),
];

#macro ENEMY_PARTY global.data.enemy_party
ENEMY_PARTY = [
	new combatant_data(true, Combatant_Team.enemy, Combatant_Row.front, Combatant_Col.left, 6, 1, "George Perdy", ENEMY_COMBAT_SPRITES, GUN), 
	new combatant_data(true, Combatant_Team.enemy, Combatant_Row.front, Combatant_Col.center, 7, 3, "Greene Lewell", ENEMY_COMBAT_SPRITES, GUN),
	//new combatant_data(true, Combatant_Team.enemy, Combatant_Row.front, 2, 7, "Whomst Whatsit", ENEMY_COMBAT_SPRITES, GUN), 
	//new combatant_data(true, Combatant_Team.enemy, Combatant_Row.back, 0, 7, "Whomst Whatsit", ENEMY_COMBAT_SPRITES, GUN), 
	new combatant_data(true, Combatant_Team.enemy, Combatant_Row.back, Combatant_Col.center, 7, 6, "Jean-Charles Deniau", ENEMY_COMBAT_SPRITES, GUN), 
	new combatant_data(true, Combatant_Team.enemy, Combatant_Row.back, Combatant_Col.right, 7, 2, "Whomst Whatsit", ENEMY_COMBAT_SPRITES, GUN), 
];

#macro ENEMY_PARTIES global.data.enemy_parties
ENEMY_PARTIES = {
	soldier_four: [
		new combatant_data(true, Combatant_Team.enemy, Combatant_Row.front, Combatant_Col.left, 6, 1, "George Perdy", ENEMY_COMBAT_SPRITES, GUN), 
		new combatant_data(true, Combatant_Team.enemy, Combatant_Row.front, Combatant_Col.center, 7, 3, "Greene Lewell", ENEMY_COMBAT_SPRITES, GUN),
		new combatant_data(true, Combatant_Team.enemy, Combatant_Row.back, Combatant_Col.center, 7, 6, "Jean-Charles Deniau", ENEMY_COMBAT_SPRITES, GUN), 
		new combatant_data(true, Combatant_Team.enemy, Combatant_Row.back, Combatant_Col.right, 7, 2, "Whomst Whatsit", ENEMY_COMBAT_SPRITES, GUN), 
	],
	wolf_3: [
		new combatant_data(false, Combatant_Team.player, Combatant_Row.front, Combatant_Col.left, 5, 10, "Wolf", ENEMY_COMBAT_SPRITES, WOLF_CLAW),
		new combatant_data(false, Combatant_Team.player, Combatant_Row.front, Combatant_Col.center, 5, 10, "Wolf", ENEMY_COMBAT_SPRITES, WOLF_CLAW),
		new combatant_data(false, Combatant_Team.player, Combatant_Row.front, Combatant_Col.right, 5, 10, "Wolf", ENEMY_COMBAT_SPRITES, WOLF_CLAW),
	],
}

// Stores 'keys' referring to the player's current map location and prior locations, as an [x,y] array
global.data.map_location_keys_visited = [];