function room_transition_start(_room) {
	instance_create_depth(0, 0, 0, obj_transition_fade, {
		rm_callback: _room,
	})
}