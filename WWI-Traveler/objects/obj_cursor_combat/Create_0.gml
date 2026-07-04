event_inherited();
states.define(State.select_action, state_cursor_select_action);
states.define(State.select_target, state_cursor_select_target);
states.define(State.select_reposition, state_cursor_select_reposition);
// NOTE: Combat manager queues state

my_combatant = noone;