event_inherited();

// whether or not to accept mouse input
listening = true;

flash_duration = 5;
flash_remaining = -1;
//states.define(State.flash, state_flash);

start_flash = function(_flashes) {
	flash_remaining = flash_duration * _flashes * 2;
	//states.queue(State.flash);
}