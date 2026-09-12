function combatant_get_targets(_combatant){
	var _combatants = array_concat(PARTY, ENEMY_PARTY);
	var _filter = method(_combatant, function(_val) {
		return _val.team != team;
	});
	var _valid_targets = array_filter(_combatants, _filter);
	return _valid_targets;
}