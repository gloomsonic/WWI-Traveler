function attack_melee_get_accuracy( _weapon, _target_row) {
	var _accuracy = _weapon.accuracy_melee;
	if (_target_row == 1)
		_accuracy *= 0.5;
	return _accuracy
}

//function attack_ranged_get_accuracy( _weapon, _target_row) {
//	var _accuracy = _weapon.accuracy_ranged;
//	return _accuracy
//}