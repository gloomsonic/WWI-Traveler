event_user_all();

// Set turn order
var _combatants = array_concat(PARTY, ENEMY_PARTY);
turn_order = array_shuffle(_combatants);
active_combatant = noone;
combat_log = [];