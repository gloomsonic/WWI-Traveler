function combatant_create_actor(_combatant) {
	var _pos = noone;
	var _team = _combatant.team;
	var _col = _combatant.col;
	var _row = _combatant.row;
	with (obj_combat_actor_position) {
		if (team != _team) continue;
		if (col != _col) continue;
		if (row != _row) continue;
		_pos = id;
		break;
	}

	instance_create_depth(0, 0, depth, obj_combat_actor, {
		x: _pos.x,
		y: _pos.y,
		sprite_index: spr_combatant_idle,
		my_combatant: _combatant,
	});
}