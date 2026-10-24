actions_queue = [];
actions_ongoing = [];

//cutscene_actions = [];
callback = undefined;
occupied_lanes = [];

add_action = function(_action) {
	//array_push(cutscene_actions, _action);
	array_push(actions_queue, _action);
}

set_callback = function(_callback) {
	callback = _callback;
}

// Combat action done, unoccupy its lanes
signal_add(new signal_listener(id, Signal_Type.on_combat_action_done, function(_actor) {
	
	var _action_index = array_find_struct_with(actions_ongoing, "actor", _actor);
	var _action = actions_ongoing[_action_index];
	
	// Clear action's lanes
	for (var l = 0; l < array_length(_action.lanes); l++) { 
		var _lane = _action.lanes;
		var _lane_index = array_get_index(occupied_lanes, _lane);
		array_delete(occupied_lanes, _lane_index, 1);
	}
	array_delete(actions_ongoing, _action_index, 1);	
	
	//// Remove this actor's action
	//for (var a = 0; a < array_length(actions_ongoing); a++) {
	//	var _action = actions_ongoing[a];
	//	if (_action.actor != _actor) continue;
		
	//	// Remove lanes from 'occupied_lanes'
	//	for (var l = 0; l < array_length(_action.lanes); l++) { 
	//		var _lane = _action.lanes;
	//		var _index = array_get_index(occupied_lanes, _lane);
	//		array_delete(occupied_lanes, _index, 1);
	//	}
	//	array_delete(actions_ongoing, a, 1);
	//	break;
	//}
}));