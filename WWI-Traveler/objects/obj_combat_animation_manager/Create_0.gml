cutscene_actions = [];
callback = undefined;

add_action = function(_action) {
	array_push(cutscene_actions, _action);
}

set_callback = function(_callback) {
	callback = _callback;
}