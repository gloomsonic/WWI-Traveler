//// needed to add this to keep the game from crashing when entering combat again form the map
//global.library = {};

event_user_all();

enemy_datas = [];
enemy_datas[0] = [
	noone,
	new combatant_data(true, Combatant_Team.enemy, 6, "George Perdy", new weapon(3, 0.80)), 
	new combatant_data(true, Combatant_Team.enemy, 7, "Greene Lewell", new weapon(3, 0.80)), 
	noone,
];
enemy_datas[1] = [
	noone,
	new combatant_data(true, Combatant_Team.enemy, 7, "Jean-Charles Deniau", new weapon(2, 0.80)), 
	noone,
];

// Combatant spaces
var _y = [0.77*ROOM_H, 0.92*ROOM_H, 0.47*ROOM_H, 0.32*ROOM_H];
team_player_rows = [];
team_player_rows[0] = [
	instance_create_layer(ROOM_W *  1/15, _y[0], "spaces", obj_combatant_space),
	instance_create_layer(ROOM_W *  5/15, _y[0], "spaces", obj_combatant_space),
	instance_create_layer(ROOM_W *  9/15, _y[0], "spaces", obj_combatant_space),
	instance_create_layer(ROOM_W * 13/15, _y[0], "spaces", obj_combatant_space),
];
team_player_rows[1] = [
	instance_create_layer(ROOM_W *  3/15, _y[1], "spaces", obj_combatant_space),
	instance_create_layer(ROOM_W *  7/15, _y[1], "spaces", obj_combatant_space),
	instance_create_layer(ROOM_W * 11/15, _y[1], "spaces", obj_combatant_space),	
];
team_enemy_rows = [];
team_enemy_rows[0] = [
	instance_create_layer(ROOM_W *  2/15, _y[2], "spaces", obj_combatant_space),
	instance_create_layer(ROOM_W *  6/15, _y[2], "spaces", obj_combatant_space),
	instance_create_layer(ROOM_W * 10/15, _y[2], "spaces", obj_combatant_space),
	instance_create_layer(ROOM_W * 14/15, _y[2], "spaces", obj_combatant_space),
];
team_enemy_rows[1] = [
	instance_create_layer(ROOM_W *  4/15, _y[3], "spaces", obj_combatant_space),
	instance_create_layer(ROOM_W *  8/15, _y[3], "spaces", obj_combatant_space),
	instance_create_layer(ROOM_W * 12/15, _y[3], "spaces", obj_combatant_space),	
];
combatants = spawn_combatants();

// Placeholder default turn queue, will be determined by speed
turn_done = true;
turn_queue = [];
array_copy(turn_queue, 0, combatants, 0, array_length(combatants));
turn_queue = array_shuffle(turn_queue);

