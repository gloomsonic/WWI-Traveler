// needed to add this to keep the game from crashing when entering combat again form the map
global.library = {};

event_user_all();

// Combatants
combatant_datas = array_concat(global.data.party, [
	new combatant_data(true, Combatant_Team.enemy, 0, 1, 6, 3, "George Perdy"), 
	new combatant_data(true, Combatant_Team.enemy, 0, 2, 7, 2, "Greene Lewell"), 
	new combatant_data(true, Combatant_Team.enemy, 1, 1, 7, 2, "Jean-Charles Deniau"), 
]);

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
var _player = get_team(Combatant_Team.player);
var _enemy = get_team(Combatant_Team.enemy);
turn_queue = [
	_player[0],
	_enemy[0],
	_player[0],
	_player[1],
	_enemy[1],
	_player[2],
	_enemy[2],
];

