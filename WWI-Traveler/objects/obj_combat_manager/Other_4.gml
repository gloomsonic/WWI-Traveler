// Spawn actors
var _combatants = array_concat(PARTY, ENEMY_PARTY);
for (var i = 0; i < array_length(_combatants); i++) {
	var _combatant = _combatants[i];
	combatant_create_actor(_combatant);
}

// Start combat
turn_start();