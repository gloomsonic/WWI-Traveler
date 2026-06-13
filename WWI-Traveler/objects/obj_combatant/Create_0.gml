event_inherited();

ready = true;
flash_duration = 5;
flash_remaining = -1;
states.define(State.flash, state_flash);
states.define(State.attack, state_attack);

start_flash = function(_flashes) {
	flash_remaining = flash_duration * _flashes * 2;
	states.queue(State.flash);
}
start_attack = function() {
	states.queue(State.attack);
}

signal_ready = function() {
	ready = true;
	signal_raise(Signal_Type.on_combatant_ready);
}