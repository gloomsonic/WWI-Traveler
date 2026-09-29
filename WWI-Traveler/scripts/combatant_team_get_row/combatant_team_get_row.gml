function combatant_team_get_row(_team, _row) {
	var _party = PARTY;
	if (_team == Combatant_Team.enemy)
		_party = ENEMY_PARTY;
	
	var _row_combatants = [];
	for (var i = 0; i < array_length(_party); i++) {
		var _combatant = _party[i];
		if (_combatant.row != _row) continue;
		array_push(_row_combatants, _combatant);
	}
	return _row_combatants;
}