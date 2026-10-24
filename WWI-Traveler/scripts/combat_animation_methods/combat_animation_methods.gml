function combat_animation_methods() {
	
	add_action = function(_action) {
		array_push(actions_queue, _action);
	}

	set_callback = function(_callback) {
		callback = _callback;
	}
}