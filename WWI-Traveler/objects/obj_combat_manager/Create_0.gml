combatant_data = [
	new combatant(false, Combatant_Team.player, 0), 
	new combatant(false, Combatant_Team.player, 1), 
	new combatant(true, Combatant_Team.enemy, 0), 
	new combatant(true, Combatant_Team.enemy, 1), 
];

// Spawn combatants
team_player = [];
team_enemy = [];
for (var i = 0; i < array_length(combatant_data); i++) {
	var _data = combatant_data[i];
	var _combatant = instance_create_layer(0, 0, "combatant_animation", obj_combatant_visual, _data);
	
	if (_data.team == Combatant_Team.player) {
		array_push(team_player, _combatant);
		_combatant.x = (ROOM_W * 0.4) + (1024 * _data.pos);
		_combatant.y = ROOM_H * 0.75;
	} else {
		array_push(team_enemy, _combatant);
		_combatant.x = (ROOM_W * 0.25) + (1024 * _data.pos);
		_combatant.y = ROOM_H_H;
	}
}

// Placeholder default turn queue, will be determined by speed
turn_done = true;
turn_queue = [
	team_player[0], 
	team_enemy[0], 
	team_player[0],
	team_player[1],
	team_enemy[1],
];


//// Create combatant structs in teams
//data_player = [
//	new combatant(false, Combatant_Team.player, 0), 
//	new combatant(false, Combatant_Team.player, 1), 
//];
//data_enemy = [
//	new combatant(true, Combatant_Team.enemy, 0), 
//	new combatant(true, Combatant_Team.enemy, 1), 
//];


//// Create combatant objects
//team_player = [];
//var _x = ROOM_W * 0.4;
//var _y = ROOM_H * 0.75;
//for (var i = 0; i < array_length(data_player); i++) {
//	//var _combatant = team_player[i];
//	var _data = data_player[i];
//	var _combatant = instance_create_layer(_x, _y, "combatant_animation", obj_combatant_visual, _data);
//	array_push(team_player, _combatant);
//	_x += 1024;
//}

//team_enemy = [];
//var _x = ROOM_W * 0.25;
//var _y = ROOM_H_H;
//for (var i = 0; i < array_length(data_enemy); i++) {
//	//var _combatant = team_enemy[i];
//	var _data = data_enemy[i];
//	var _combatant = instance_create_layer(_x, _y, "combatant_animation", obj_combatant_visual, _data);
//	array_push(team_enemy, _combatant);
//	_x += 1024;
//}



// Methods
end_turn = function() {
	turn_done = true;
}
get_enemies = function() {
	return team_enemy;
}