function combatant_get_actor(_combatant) {
	with (obj_combat_actor) {
		if (my_combatant != _combatant) continue;
		return id;
	}
	return noone;
}