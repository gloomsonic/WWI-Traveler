function combatants_get_all() {
	var _combatants = [];
	with (obj_combatant) {
		if (my_data == noone) continue;
		array_push(_combatants, id);
	}
	return _combatants;
}