if (callback == undefined)
	exit;
	
// Start actions whose necessary lanes are unoccupied
for (var i = 0; i < array_length(actions_queue); i++) {
	var _action = actions_queue[i];
	var _intersection = array_intersection(_action.lanes, occupied_lanes); // Check action's lanes against occupied lanes
	if (array_length(_intersection) > 0)
		continue; // Lane(s) occupied, can't start
	
	// Action's desired lanes are open: occupy, start action, and swap array
	occupied_lanes = array_concat(occupied_lanes, _action.lanes);
	_action.actor.try_state(_action.state); // Start actor action -- NOTE: state will send a signal when it's done with its lanes
	array_push(actions_ongoing, _action);
	array_delete(actions_queue, i, 1);
	i--;
}

// Callback
var _done = true;
if (array_length(actions_queue) > 0) _done = false;
if (array_length(actions_ongoing) > 0) _done = false;
if (_done) {
	callback();
	callback = undefined;
}

//// NOTE: this loops through all the actions to progress them.
//// Update first action in each lane
//var _active_lanes = [];
//for (var i = 0; i < array_length(cutscene_actions); i++) {
//	var _action = cutscene_actions[i];
	
//	// Does this action conflict with an existing lane?
//	var _intersection = array_intersection(_action.lanes, _active_lanes);
//	if (array_length(_intersection) > 0) 
//		continue;
	
//	_active_lanes = array_concat(_active_lanes, _action.lanes);
//	if (_action.update()) { // Spawn and update
//		array_delete(cutscene_actions, i, 1);
//		i--;		
//	}
//}

//// Callback
//if (array_length(cutscene_actions) <= 0) {
//	callback();
//	callback = undefined;
//}