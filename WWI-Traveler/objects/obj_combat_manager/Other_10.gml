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
	return _team;
}

get_spaces = function(_team_index) {
	if (_team_index == Combatant_Team.player)
		return array_concat(team_player_rows[0], team_player_rows[1]);
	if (_team_index == Combatant_Team.enemy)
		return array_concat(team_enemy_rows[0], team_enemy_rows[1]);
}

// Create selectable combat options
spawn_combat_menu = function() {
	var _lh = sprite_get_height(spr_combat_menu_attack);
	var _y = ROOM_H - 500;
	instance_create_layer(0, _y, "menu", obj_combat_menu_attack);
	_y += _lh;
	instance_create_layer(0, _y, "menu", obj_combat_menu_guard);
	_y += _lh;
	instance_create_layer(0, _y, "menu", obj_combat_menu_reposition);
	_y += _lh;
	instance_create_layer(0, _y, "menu", obj_combat_menu_pass);
}

