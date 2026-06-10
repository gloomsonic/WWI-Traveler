// Create combatant structs in teams
team_player = [
	new combatant(false, Combatant_Team.player, 0), 
	new combatant(false, Combatant_Team.player, 1), 
];
team_enemy = [
	new combatant(true, Combatant_Team.enemy, 0), 
	new combatant(true, Combatant_Team.enemy, 1), 
];

turn_queue = [
	team_player[0], 
	team_enemy[0], 
	team_player[0],
	team_player[1],
	team_enemy[1],
];
turn_done = true;

// Methods
end_turn = function() {
	turn_done = true;
}