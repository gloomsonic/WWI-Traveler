function get_combatant_team(_team) {
	var _combatants = [];
	with (obj_combatant) {
		if (my_data == noone) continue;
		if (my_data.team != _team) continue;
		array_push(_combatants, id);
	}
	return _combatants;
}