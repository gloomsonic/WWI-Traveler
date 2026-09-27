event_inherited();

states.define(State.camp, state_cursor_camp);
states.queue(State.camp);

touch_these = [];
add_touchable = function(_inst) {
	array_push(touch_these, _inst);
}
delete_touchable = function(_inst) {
	var _index = array_get_index(touch_these, _inst);
	if (_index == -1) return;
	array_delete(touch_these, _index, 1);
}