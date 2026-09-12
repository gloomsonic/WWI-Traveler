function start_attack(_attacker, _target) {
	_attacker.check_attack();
	_target.check_hit(_attacker.my_data.melee.damage, _attacker.my_data.melee.accuracy);
}