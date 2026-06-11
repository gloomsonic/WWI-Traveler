// Create combatant structs in teams
team_player = [
	new combatant(false, Combatant_Team.player, 0), 
	new combatant(false, Combatant_Team.player, 1), 
];
team_enemy = [
	new combatant(true, Combatant_Team.enemy, 0), 
	new combatant(true, Combatant_Team.enemy, 1), 
];

// Placeholder default turn queue, will be determined by speed
turn_queue = [
	team_player[0], 
	team_enemy[0], 
	team_player[0],
	team_player[1],
	team_enemy[1],
];
turn_done = true;

// Create combatant animation objects
var _x = ROOM_W * 0.4;
var _y = ROOM_H * 0.75;
for (var i = 0; i < array_length(team_player); i++) {
	var _combatant = team_player[i];
	instance_create_layer(_x, _y, "combatant_animation", obj_combatant_visual);
	_x += 1024;
}
var _x = ROOM_W * 0.25;
var _y = ROOM_H_H;
for (var i = 0; i < array_length(team_enemy); i++) {
	var _combatant = team_enemy[i];
	instance_create_layer(_x, _y, "combatant_animation", obj_combatant_visual);
	_x += 1024;
}

// Methods
end_turn = function() {
	turn_done = true;
}