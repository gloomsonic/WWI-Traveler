global.data = {};

#macro ENCOUNTER_QUEUE global.data.encounter_queue
ENCOUNTER_QUEUE = [];

// -- Scene stuff -- //
#macro SCENE_NEXT global.data.scene_next
SCENE_NEXT = noone;

// -- Combat stuff -- //
// Default groups of combatant sprites
#macro PLAYER_COMBAT_SPRITES global.data.player_combatant_sprites
PLAYER_COMBAT_SPRITES = new combatant_sprites(spr_combatant_player_idle, spr_combatant_attack, spr_combatant_guard, spr_combatant_attack_ranged);
#macro ENEMY_COMBAT_SPRITES global.data.enemy_combatant_sprites
ENEMY_COMBAT_SPRITES = new combatant_sprites(spr_combatant_idle, spr_combatant_attack, spr_combatant_guard, spr_combatant_attack_ranged);

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
ENEMY_PARTY = [];
#macro ENEMY_PARTIES global.data.enemy_parties
ENEMY_PARTIES = {
	test_easy: [
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.front,	Combatant_Col.left,		1, 1, "whoops",					ENEMY_COMBAT_SPRITES, FIST),
	],
	soldier_4: [
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.front,	Combatant_Col.left,		6, 1, "George Perdy",			ENEMY_COMBAT_SPRITES, GUN), 
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.front,	Combatant_Col.center,	7, 3, "Greene Lewell",			ENEMY_COMBAT_SPRITES, GUN),
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.back,		Combatant_Col.center,	7, 6, "Jean-Charles Deniau",	ENEMY_COMBAT_SPRITES, GUN), 
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.back,		Combatant_Col.right,	7, 2, "Whomst Whatsit",			ENEMY_COMBAT_SPRITES, GUN), 
	],													
	soldier_6: [										
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.front,	Combatant_Col.left,		6, 1, "George Perdy",			ENEMY_COMBAT_SPRITES, GUN), 
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.front,	Combatant_Col.center,	7, 3, "Greene Lewell",			ENEMY_COMBAT_SPRITES, GUN),
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.front,	Combatant_Col.right,	7, 2, "Whomst Whatsit",			ENEMY_COMBAT_SPRITES, GUN), 
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.back,		Combatant_Col.left,		7, 4, "Whomst Whatsit",			ENEMY_COMBAT_SPRITES, GUN), 
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.back,		Combatant_Col.center,	7, 6, "Jean-Charles Deniau",	ENEMY_COMBAT_SPRITES, GUN), 
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.back,		Combatant_Col.right,	7, 2, "Whomst Whatsit",			ENEMY_COMBAT_SPRITES, GUN), 	
	],
	wolf_3: [
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.front,	Combatant_Col.left,		5, 10, "Wolf",					ENEMY_COMBAT_SPRITES, WOLF_CLAW),
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.front,	Combatant_Col.center,	5, 10, "Wolf",					ENEMY_COMBAT_SPRITES, WOLF_CLAW),
		new combatant_data(true, Combatant_Team.enemy,	Combatant_Row.front,	Combatant_Col.right,	5, 10, "Wolf",					ENEMY_COMBAT_SPRITES, WOLF_CLAW),
	],
}

// -- Map stuff -- //
#macro MAP_PATH_SELECTED global.data.map_path_selected
MAP_PATH_SELECTED = noone;
#macro LOCATION_CURRENT global.data.location_current
LOCATION_CURRENT = location_1;
#macro LOCATION_NEXT global.data.location_next
LOCATION_NEXT = location_1;

//// Stores 'keys' referring to the player's current map location and prior locations, as an [x,y] array
//global.data.map_location_keys_visited = [];