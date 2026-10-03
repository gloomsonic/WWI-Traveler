combat_manager_methods_turn_phases();
combat_manager_methods_action_callbacks();

// Set turn order by 'spd'
turn_order = array_concat(PARTY, ENEMY_PARTY);
array_sort(turn_order, function(_curr, _next) {
	return _next.spd - _curr.spd;
});

active_combatant = noone;
combat_log = [];