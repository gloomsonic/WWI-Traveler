if (target_node != noone && instance_exists(target_node)){
	if (point_distance(x, y, target_node.x, target_node.y) <= move_speed){
		// arrived — snap on and go idle
		x = target_node.x;
		y = target_node.y;
		current_node_id = target_node.node_id;
        var _feature = target_node.feature;   // capture before we clear target_node
                
        target_node = noone;
        travel_path = noone;
                
        global.map_current_node = current_node_id;   // for the return trip
                
        if (!node_is_complete(current_node_id)){
                node_mark_complete(current_node_id);
                global.pending_scene = scene_pick(biome_feature(_feature));
                global.map_resume = true;                // re-entering rm_map should res
                room_goto(rm_scene);
        }
	}
	else {
		var _dir = point_direction(x, y, target_node.x, target_node.y);
        x += lengthdir_x(move_speed, _dir);
        y += lengthdir_y(move_speed, _dir);
	}
}
	
