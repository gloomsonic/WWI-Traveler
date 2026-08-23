function start_attack(_attacker, _target) {
	_attacker.check_attack();
	_target.check_hit(_attacker.my_data.melee.damage, _attacker.my_data.melee.accuracy);
}

//init_attack = function(_attacker, _target) {
//	_attacker.start_attack();
//	_target.start_hit(_attacker.my_data.melee.damage, _attacker.my_data.melee.accuracy);
	
//	_attacker.ready = false;
//	_target.ready = false;