event_inherited();

my_combatant = noone;

get_combatant = function() {
	return my_combatant;
}
set_combatant = function(_combatant) {
	my_combatant = _combatant;
	if (my_combatant != noone)
		my_combatant.set_space(id);
}
free = function() {
	my_combatant = noone;
}

//get_team = function() {
//	var _player_team = obj_combat_manager.get_spaces(Combatant_Team.player);
//	if (array_get_index(_player_team, id) != -1)
//		return Combatant_Team.player;
//	return Combatant_Team.enemy;
//}
//get_row_pos = function() {
//	var _team = get_team();
//	obj_combat_manager.get_row_pos_space()
//	// Check both team_player_rows
//}