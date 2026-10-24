combat_animation_methods();
callback = undefined;
actions_queue = [];
actions_ongoing = [];
occupied_lanes = [];

// Combat action done, remove from 'actions_ongoing' and free its lanes
signal_add(new signal_listener(id, Signal_Type.on_combat_action_done, function(_actor) {
	
	var _action_index = array_find_struct_with(actions_ongoing, "actor", _actor);
	var _action = actions_ongoing[_action_index];
	
	// Free action's lanes
	for (var l = 0; l < array_length(_action.lanes); l++) { 
		var _lane = _action.lanes;
		var _lane_index = array_get_index(occupied_lanes, _lane);
		array_delete(occupied_lanes, _lane_index, 1);
	}
	array_delete(actions_ongoing, _action_index, 1);	
}));