event_user_all();

// Commit states
states = new use_states();
states.define(State.idle, state_idle);
states.define(State.hovered, state_hovered);
states.define(State.held, state_held);
states.queue(State.idle);

ignore_cursor = false;
try_cursor_queue = function(_state) {
	if (ignore_cursor) return false;
	states.queue(_state);
	return true;
}

try_cursor_pressed = function() {
	if (ignore_cursor) return false;
	on_pressed();
	return true;
}

try_cursor_released = function() {
	if (ignore_cursor) return false;
	on_released();
	return true;
}