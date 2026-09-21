if (callback == undefined)
	exit;

// 
var _active_lanes = [];
for (var i = 0; i < array_length(cutscene_actions); i++) {
	var _action = cutscene_actions[i];
	
	// Does this action conflict with an existing lane?
	var _intersection = array_intersection(_action.lanes, _active_lanes);
	if (array_length(_intersection) > 0) 
		continue;
	
	_active_lanes = array_concat(_active_lanes, _action.lanes);
	if (_action.update()) { // Spawn and update
		array_delete(cutscene_actions, i, 1);
		i--;		
	}
}

// Callback
if (array_length(cutscene_actions) <= 0) {
	callback();
	callback = undefined;
}