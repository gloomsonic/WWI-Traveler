event_user_all();

combatant_datas = [
	new combatant_data(false, Combatant_Team.player, 0), 
	new combatant_data(false, Combatant_Team.player, 1), 
	new combatant_data(true, Combatant_Team.enemy, 0), 
	new combatant_data(true, Combatant_Team.enemy, 1), 
];

// Spawn combatants
team_player = [];
team_enemy = [];
for (var i = 0; i < array_length(combatant_datas); i++) {
	var _data = combatant_datas[i];
	var _combatant = instance_create_layer(0, 0, "combatant_animation", obj_combatant, _data);
	
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

