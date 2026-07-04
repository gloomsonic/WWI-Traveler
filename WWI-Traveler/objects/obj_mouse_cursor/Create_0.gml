event_user_all();

states = new use_states();
states.define(State.select_action, state_cursor_select_action);
states.define(State.select_target, state_cursor_select_target);
states.define(State.select_reposition, state_cursor_select_reposition);
states.define(State.story_choose, state_cursor_story_choose); // TODO: should these be separate objects of the same parent?

touch_these = noone;
hovered = noone;
my_combatant = noone;

set_combatant = function(_combatant) {
	my_combatant = _combatant;
}