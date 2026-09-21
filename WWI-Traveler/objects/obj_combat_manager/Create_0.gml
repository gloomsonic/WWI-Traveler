//event_user_all();
combat_manager_methods_turn_phases();
combat_manager_methods_action_callbacks();

// Set turn order
var _combatants = array_concat(PARTY, ENEMY_PARTY);
turn_order = array_shuffle(_combatants);
active_combatant = noone;
combat_log = [];