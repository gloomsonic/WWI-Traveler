function combatant_create_actor(_combatant) {
	//var _xpad = 500;
	//var _ypad = 500;
	//var _l = ROOM_W_H - _xpad;
	//var _t = ROOM_H_H;
	//if (_combatant.team == Combatant_Team.player)
	//	_t += _ypad;
	//else
	//	_t -= _ypad;
	
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
		x: _pos.x, //_l + (_combatant.col * 400),
		y: _pos.y, //_t + (_combatant.row * 400),
		sprite_index: spr_combatant_idle,
		my_combatant: _combatant,
	});
}