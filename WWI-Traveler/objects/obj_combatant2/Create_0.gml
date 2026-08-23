event_inherited();

self[$ "my_data"] ??= {}; // reference to global combatant data
if (my_data != noone)
	sprite_index = my_data.sprite_index;

ready = true;
flash_count = 3;
flash_duration = 4;
flash_remaining = -1;
states.define(State.evaded, state_evaded);
states.define(State.hit, state_hit);
states.define(State.attack, state_attack);

// Methods
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

check_attack = function() {
	ready = false;
	states.queue(State.attack);
}

signal_ready = function() {
	ready = true;
	signal_raise(Signal_Type.on_combatant_ready);
}