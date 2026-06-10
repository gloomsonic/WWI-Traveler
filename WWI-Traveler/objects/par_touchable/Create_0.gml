event_user_all();

// Commit states
states = new use_states();
states.define(State.idle, state_idle);
states.define(State.hovered, state_hovered);
states.define(State.held, state_held);
states.queue(State.idle);