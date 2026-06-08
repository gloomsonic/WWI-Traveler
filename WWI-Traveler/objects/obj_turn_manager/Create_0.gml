combatants = [
	new combatant(false, Combatant_Team.player), 
	new combatant(false, Combatant_Team.player), 
	new combatant(true, Combatant_Team.enemy), 
	new combatant(true, Combatant_Team.enemy), 
];
turn_queue = [
	combatants[0], 
	combatants[1], 
	combatants[0],
	combatants[2], 
	combatants[3],
];
turn_done = true;