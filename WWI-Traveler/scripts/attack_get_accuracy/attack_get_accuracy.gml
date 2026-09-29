function attack_melee_get_accuracy(_weapon, _attacker, _target) {
	var _accuracy = _weapon.accuracy_melee;
	
	// No one in front, treat back as front
	var _attacker_row = _attacker.row;
	var _attacker_front = combatant_team_get_row(_target.team, Combatant_Row.front);
	if (array_length(_attacker_front) <= 0)
		_attacker_row = Combatant_Row.front;

	var _target_row = _target.row;
	var _target_front = combatant_team_get_row(_target.team, Combatant_Row.front);
	if (array_length(_target_front) <= 0)
		_target_row = Combatant_Row.front;
	
	// Apply buffs/debuffs
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

function attack_ranged_get_accuracy(_weapon, _attacker, _target) {
	var _accuracy = _weapon.accuracy_ranged;
	
	// No one in front, treat back as front
	var _attacker_row = _attacker.row;
	var _attacker_front = combatant_team_get_row(_target.team, Combatant_Row.front);
	if (array_length(_attacker_front) <= 0)
		_attacker_row = Combatant_Row.front;

	var _target_row = _target.row;
	var _target_front = combatant_team_get_row(_target.team, Combatant_Row.front);
	if (array_length(_target_front) <= 0)
		_target_row = Combatant_Row.front;	
	
	// Apply buffs/debuffs
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