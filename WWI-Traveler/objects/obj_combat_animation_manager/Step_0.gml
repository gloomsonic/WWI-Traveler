if (callback == undefined)
	exit;
	
// Start actions whose necessary lanes are unoccupied
for (var i = 0; i < array_length(actions_queue); i++) {
	var _action = actions_queue[i];
	var _intersection = array_intersection(_action.lanes, occupied_lanes); // Check action's lanes against occupied lanes
	if (array_length(_intersection) > 0)
		continue; // Lane(s) occupied, can't start
	
	// Action's desired lanes are open: occupy, start action, and swap array
	if (instance_exists(_action.actor)) {
		occupied_lanes = array_concat(occupied_lanes, _action.lanes);
		_action.actor.start_action(_action);
		array_push(actions_ongoing, _action);
		
		if (_action.sfx != noone)
			audio_oneshot(_action.sfx);//, _action.actor.x, _action.actor.y);
	}
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