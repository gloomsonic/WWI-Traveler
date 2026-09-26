function attack_melee_get_accuracy(_weapon, _attacker_row, _target_row) {
	var _accuracy = _weapon.accuracy_melee;
	switch (_attacker_row) {
		case Combatant_Row.front:
			_accuracy *= 1.0;
			break;
		case Combatant_Row.back:
			_accuracy *= 0.6;
			break;
	}
	switch (_target_row) {
		case Combatant_Row.front:
			_accuracy *= 1.0;
			break;
		case Combatant_Row.back:
			_accuracy *= 0.6;
			break;
	}	
	return _accuracy;
}

function attack_ranged_get_accuracy(_weapon, _attacker_row, _target_row) {
	var _accuracy = _weapon.accuracy_ranged;
	switch (_attacker_row) {
		case Combatant_Row.front:
			_accuracy *= 1.0;
			break;
		case Combatant_Row.back:
			_accuracy *= 1.0;
			break;
	}
	switch (_target_row) {
		case Combatant_Row.front:
			_accuracy *= 1.0;
			break;
		case Combatant_Row.back:
			_accuracy *= 0.8;
			break;
	}
	return _accuracy;
}