event_user_all();

// Set turn order
var _combatants = array_concat(PARTY, ENEMY_PARTY);
turn_order = array_shuffle(_combatants);
active_combatant = noone;
combat_log = [];

// Spawn player actors
for (var i = 0; i < array_length(PARTY); i++) {
	var _combatant = PARTY[i];
	combatant_create_actor(_combatant);
}