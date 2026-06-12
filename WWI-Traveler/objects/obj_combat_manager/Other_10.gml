///@desc methods
end_turn = function() {
	turn_done = true;
}
get_enemies = function() {
	return team_enemy;
}

// 
init_attack = function(_attacker, _target) {
	_attacker.sprite_index = spr_combatant_attack;
	_target.start_flash(5);
	// How does the turn end? When the flashing stops... 
}