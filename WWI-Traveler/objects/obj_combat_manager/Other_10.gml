///@desc methods

end_turn = function() {
	turn_done = true;
}

get_team = function(_team_index) {
	var _team = [];
	for (var i = 0; i < array_length(combatants); i++) {
		var _combatant = combatants[i];
		if (_combatant.team != _team_index) continue;
		array_push(_team, _combatant);
	}
	
	if (array_length(_team) <= 0) return noone;
	return _team;
}

get_spaces = function(_team_index) {
	if (_team_index == Combatant_Team.player)
		return array_concat(team_player_rows[0], team_player_rows[1]);
	if (_team_index == Combatant_Team.enemy)
		return array_concat(team_enemy_rows[0], team_enemy_rows[1]);
}

// Spawn the combatant objects, must be after spaces are spawned
spawn_combatants = function() {
	var _combatants = [];
	for (var i = 0; i < array_length(combatant_datas); i++) {
		var _data = combatant_datas[i];
		var _rows = _data.team == Combatant_Team.player ? team_player_rows : team_enemy_rows;
	
		var _combatant = instance_create_layer(0, 0, "combatants", obj_combatant, _data);
		var _space = _rows[_data.row][_data.pos];
		_combatant.set_space(_space);
		_space.set_combatant(_combatant);
		array_push(_combatants, _combatant);
	}
	return _combatants;
}

// Create selectable combat options
spawn_combat_menu = function(_combatant) {
	var _lh = sprite_get_height(spr_combat_menu_attack);
	var _y = ROOM_H - 500;
	instance_create_layer(0, _y, "menu", obj_combat_menu_label, {my_combatant: _combatant});
	instance_create_layer(0, _y, "menu", obj_combat_menu_attack);
	_y += _lh;
	instance_create_layer(0, _y, "menu", obj_combat_menu_guard);
	_y += _lh;
	instance_create_layer(0, _y, "menu", obj_combat_menu_reposition);
	_y += _lh;
	instance_create_layer(0, _y, "menu", obj_combat_menu_pass);
}

