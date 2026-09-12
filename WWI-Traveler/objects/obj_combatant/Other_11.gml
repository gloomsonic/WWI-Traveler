///@desc methods

// Queue the appropriate state in response to being hit
check_hit = function(_damage, _accuracy) {
	ready = false;
	var _roll = random(1.0);
	if (_roll > _accuracy) {
		states.queue(State.evaded);
	} else {
		my_data.hp -= _damage;
		flash_remaining = flash_duration * flash_count * 2; // flashes * 2 parts per flash
		states.queue(State.hit);
	}	
}

// Queue the attack state
check_attack = function() {
	ready = false;
	states.queue(State.attack);
}

// Kill combatant and on array, if dead
check_dead = function() {
	if (my_data.hp > 0) return;

	var _data = combatant_get_row_col(my_data);	
	my_data = noone;
	refresh();
	
	// Remove from global array
	if (_data.team == Combatant_Team.player)
		PARTY[_data.row][_data.col] = noone;
	if (_data.team == Combatant_Team.enemy)
		ENEMY_PARTY[_data.row][_data.col] = noone;
	
	signal_raise(Signal_Type.on_combatant_killed, id);	
}

// Respect current combatant struct or lack thereof
refresh = function() {
	if (my_data == noone) 
		sprite_index = spr_combatant_space;
	else
		sprite_index = my_data.sprite_index;
}

// Set ready and send the signal -- should maybe find a way to not need the variable
set_ready = function(_yes_no = true) {
	ready = _yes_no;
	//if (ready)
	//	signal_raise(Signal_Type.on_combatant_ready);
}