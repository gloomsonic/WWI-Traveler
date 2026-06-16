event_user_all();

combatant_datas = [
	new combatant_data(false,	Combatant_Team.player,	0, 0,	10, 3), 
	new combatant_data(false,	Combatant_Team.player,	0, 1,	9, 2), 
	new combatant_data(false,	Combatant_Team.player,	1, 2,	9, 2), 
	new combatant_data(true,	Combatant_Team.enemy,	0, 0,	6, 3), 
	new combatant_data(true,	Combatant_Team.enemy,	0, 1,	7, 2), 
	new combatant_data(true,	Combatant_Team.enemy,	1, 2,	7, 2), 
];

// Spawn combatants
combatants = [];
for (var i = 0; i < array_length(combatant_datas); i++) {
	var _data = combatant_datas[i];
	var _combatant = instance_create_layer(0, 0, "combatant_animation", obj_combatant, _data);
	array_push(combatants, _combatant);
	
	if (_data.team == Combatant_Team.player) {
		_combatant.x = (ROOM_W * 0.4) + (1024 * _data.pos);
		_combatant.y = ROOM_H * 0.75;
	} else {
		_combatant.x = (ROOM_W * 0.25) + (1024 * _data.pos);
		_combatant.y = ROOM_H_H;
	}
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

