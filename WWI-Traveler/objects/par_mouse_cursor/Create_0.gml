event_user_all();

states = new use_states();
states.define(State.idle, state_cursor_default);

touch_these = noone;
hovered = noone;

set_combatant = function(_combatant) {
	my_combatant = _combatant;
}