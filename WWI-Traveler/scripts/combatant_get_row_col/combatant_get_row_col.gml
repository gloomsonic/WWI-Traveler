function combatant_get_row_col(_combatant_data) {
	
	// Player front row
	var _row = 0;
	var _col = array_get_index(PARTY[_row], _combatant_data);
	if (_col != -1) {
		return {
			team: Combatant_Team.player,
			row: _row,
			col: _col,
		}
	}
	
	// Player back row
	var _row = 1;
	var _col = array_get_index(PARTY[_row], _combatant_data);
	if (_col != -1) {
		return {
			team: Combatant_Team.player,
			row: _row,
			col: _col,
		}
	}
	
	// Enemy front row
	var _row = 0;
	var _col = array_get_index(ENEMY_PARTY[_row], _combatant_data);
	if (_col != -1) {
		return {
			team: Combatant_Team.enemy,
			row: _row,
			col: _col,
		}
	}
	
	// Enemy back row
	var _row = 1;
	var _col = array_get_index(ENEMY_PARTY[_row], _combatant_data);
	if (_col != -1) {
		return {
			team: Combatant_Team.enemy,
			row: _row,
			col: _col,
		}
	}
}