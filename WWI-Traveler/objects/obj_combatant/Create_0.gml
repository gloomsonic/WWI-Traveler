event_inherited();

self[$ "my_space"] ??= noone;

ready = true;
flash_duration = 5;
flash_remaining = -1;
states.define(State.hit, state_hit);
states.define(State.attack, state_attack);

start_hit = function(_damage) {
	flash_remaining = flash_duration * 5 * 2; // 5 flashes * 2 parts per flash
	//_damage -= block;
	hp -= _damage;
	states.queue(State.hit);
}
start_attack = function() {
	states.queue(State.attack);
}

signal_ready = function() {
	ready = true;
	signal_raise(Signal_Type.on_combatant_ready);
}

set_space = function(_space) {
	my_space = _space;
	x = my_space.x;
	y = my_space.y;
}
get_space = function() {
	return my_space;
}