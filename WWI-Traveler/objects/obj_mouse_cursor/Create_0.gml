event_user_all();

states = new use_states();
states.define(State.select_action, state_cursor_select_action);
states.define(State.select_target, state_cursor_select_target);

touch_these = noone;
hovered = noone;
my_combatant = noone;

set_combatant = function(_combatant) {
	my_combatant = _combatant;
}