function combat_manager_methods() {
	
	// Repopulate turn order array, sort by 'spd'
	turn_order_refresh = function() {
		
		// Set turn order by 'spd'
		turn_order = array_concat(PARTY, ENEMY_PARTY);
		array_sort(turn_order, function(_curr, _next) {
			return _next.spd - _curr.spd;
		});
		
		// Filter out dead combatants
		var _check_dead = function(_val) {
			return _val.hp > 0;
		}		
		turn_order = array_filter(turn_order, _check_dead);
		PARTY = array_filter(PARTY, _check_dead);
		ENEMY_PARTY = array_filter(ENEMY_PARTY, _check_dead);		
	}
}