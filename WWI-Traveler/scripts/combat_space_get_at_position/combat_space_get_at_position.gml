function combat_space_get_at_position(_team, _row, _col) {
	var _space = noone;
	with (obj_combat_actor_space) {
		if (team != _team) continue;
		if (row != _row) continue;
		if (col != _col) continue;
		_space = id;
		break;
	}
	return _space;
}