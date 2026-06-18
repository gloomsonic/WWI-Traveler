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
var _y = [0.65, 0.80, 0.35, 0.20];
team_player_rows = [];
team_player_rows[0] = [
	new combatant_space( 1/15, _y[0]),
	new combatant_space( 5/15, _y[0]),
	new combatant_space( 9/15, _y[0]),
	new combatant_space(13/15, _y[0]),
];
team_player_rows[1] = [
	new combatant_space( 3/15, _y[1]),
	new combatant_space( 7/15, _y[1]),
	new combatant_space(11/15, _y[1]),	
];
team_enemy_rows = [];
team_enemy_rows[0] = [
	new combatant_space( 2/15, _y[2]),
	new combatant_space( 6/15, _y[2]),
	new combatant_space(10/15, _y[2]),
	new combatant_space(14/15, _y[2]),
];
team_enemy_rows[1] = [
	new combatant_space( 4/15, _y[3]),
	new combatant_space( 8/15, _y[3]),
	new combatant_space(12/15, _y[3]),	
];

// Spawn combatants
combatants = [];
for (var i = 0; i < array_length(combatant_datas); i++) {
	var _data = combatant_datas[i];
	var _rows = _data.team == Combatant_Team.player ? team_player_rows : team_enemy_rows;
	var _space = _rows[_data.row][_data.pos];
	
	var _combatant = instance_create_layer(_space.x, _space.y, "combatant_animation", obj_combatant, _data);
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

