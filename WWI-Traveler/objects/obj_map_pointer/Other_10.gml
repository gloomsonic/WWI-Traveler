///@desc states

state_map_pointer_idle = function(_event) {
	switch (_event) {
		case Event.enter:
			travel_path = noone;
			target_node = noone;
			break;
			
		case Event.step:
			if (target_node != noone)
				states.queue(State.travel);
			break;
	}
}

state_map_pointer_travel = function(_event) {
	switch (_event) {
		case Event.enter:
			break;
			
		case Event.step:
			var _len = point_distance(x, y, target_node.x, target_node.y);
			var _dir = point_direction(x, y, target_node.x, target_node.y);
			
			if (_len > move_speed) { // Travel
		        x += lengthdir_x(move_speed, _dir);
		        y += lengthdir_y(move_speed, _dir);	
			} else { // Exit state
				current_node_id = target_node.node_id;
		        global.map_current_node = current_node_id; // for the return trip
				
				// Prep scene
		        if (!node_is_complete(current_node_id)) {
			        mark_node_complete(current_node_id); // TODO: can I safely turn this struct into an array?
			        global.pending_scene = pick_scene(biome_feature(target_node.feature));
			        global.map_resume = true; // re-entering rm_map_editor should res
			        room_goto(rm_scene);
		        }
				
				// Snap to
				x = target_node.x;
				y = target_node.y;
				states.queue(State.idle);
			}
			break;
	}
}