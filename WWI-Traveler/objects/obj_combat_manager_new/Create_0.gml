// Set turn order
var _combatants = array_concat(PARTY, ENEMY_PARTY);
turn_order = array_shuffle(_combatants);
active_combatant = noone;
combat_log = [];

// Start the next combatant's turn
turn_start = function() {
	active_combatant = array_shift(turn_order);
	array_push(turn_order, active_combatant);	
	var _valid_targets = combatant_get_targets(active_combatant);
	
	// CPU vs. player turn
	if (active_combatant.team == Combatant_Team.enemy) {
		var _target = array_pop(array_shuffle(_valid_targets));
		hit_target(_target);
	} else {
		var _y = ROOM_H_H;
		var _ypad = 256;
		for (var i = 0; i < array_length(_valid_targets); i++) {
			var _combatant = _valid_targets[i];
			instance_create_depth(ROOM_W_H, _y, depth, obj_combat_choose, {
				my_combatant: _combatant,
				callback: hit_target,
			});
			_y += _ypad;
		}
	}
}

// Record attacked target and subtract damage from its hp
hit_target = function(_target) {
	var _damage = irandom(3);
	_target.hp -= _damage;
	
	// Log it
	array_push(combat_log, $"{active_combatant.name} attacked {_target.name}");
	array_push(combat_log, $"{_target.name} received {_damage} damage");
	if (_target.hp <= 0)
		array_push(combat_log, $"{_target.name} died");

	// Proceed
	turn_end();
}

// Check if combat end or next turn
turn_end = function() {
	var _check_dead = function(_val) {
		return _val.hp > 0;
	}	
	turn_order = array_filter(turn_order, _check_dead);
	PARTY = array_filter(PARTY, _check_dead);
	ENEMY_PARTY = array_filter(ENEMY_PARTY, _check_dead);
	
	// Next turn?
	if (array_length(PARTY) <= 0)
		array_push(combat_log, "You Died");
	else if (array_length(ENEMY_PARTY) <= 0)
		array_push(combat_log, "You Won");
	else
		turn_start();
}