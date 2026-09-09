event_inherited();
states.define(State.select_action, state_cursor_select_action);
//states.define(State.select_target, state_cursor_select_target);
//states.define(State.select_reposition, state_cursor_select_reposition);
states.queue(State.select_action);

touch_these = [];
add_touchable = function(_inst) {
	array_push(touch_these, _inst);
}

//my_combatant = noone;
//set_combatant = function(_combatant) {
//	my_combatant = _combatant;
//}