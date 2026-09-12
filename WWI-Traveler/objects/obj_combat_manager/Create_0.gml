event_user_all();

// Set turn order
var _combatants = array_concat(PARTY, ENEMY_PARTY);
turn_order = array_shuffle(_combatants);
//turn_timer = -1;
active_combatant = noone;
combat_log = [];