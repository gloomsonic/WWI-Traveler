function combatant_get_at_position(_row, _col) {
	for (var i = 0; i < array_length(PARTY); i++) {
		var _combatant = PARTY[i];
		if (_combatant.row != _row) continue;
		if (_combatant.col != _col) continue;
		return _combatant;
	}
	return noone;
}