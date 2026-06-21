event_user_all();

// Placeholder combatant array
combatant_datas = [
	new combatant_data(false,	Combatant_Team.player,	0, 1,	10, 3), 
	new combatant_data(false,	Combatant_Team.player,	0, 2,	9, 2), 
	new combatant_data(false,	Combatant_Team.player,	1, 1,	9, 2), 
	new combatant_data(true,	Combatant_Team.enemy,	0, 1,	6, 3), 
	new combatant_data(true,	Combatant_Team.enemy,	0, 2,	7, 2), 
	new combatant_data(true,	Combatant_Team.enemy,	1, 1,	7, 2), 
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

// Spawn combatants
combatants = [];
for (var i = 0; i < array_length(combatant_datas); i++) {
	var _data = combatant_datas[i];
	var _rows = _data.team == Combatant_Team.player ? team_player_rows : team_enemy_rows;
	
	var _combatant = instance_create_layer(0, 0, "combatants", obj_combatant, _data);
	var _space = _rows[_data.row][_data.pos];
	_combatant.set_space(_space);
	_space.set_combatant(_combatant);
	array_push(combatants, _combatant);
}

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
];

