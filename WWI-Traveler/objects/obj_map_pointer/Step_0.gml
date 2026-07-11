if (target_node != noone && instance_exists(target_node)){
	if (point_distance(x, y, target_node.x, target_node.y) <= move_speed){
		// arrived — snap on and go idle
		x = target_node.x;
		y = target_node.y;
		current_node_id = target_node.node_id;
		
		// Queue this node's arrival scene, chosen from its geographical-feature biome.
        global.pending_scene = scene_pick(biome_feature(target_node.feature));
				
		target_node = noone;
		travel_path = noone;

		global.map_current_node = current_node_id;   // for the return trip
		global.map_resume = true;                    // re-entering rm_map should resume play
		room_goto(rm_scene);
	}
	else {
		var _dir = point_direction(x, y, target_node.x, target_node.y);
        x += lengthdir_x(move_speed, _dir);
        y += lengthdir_y(move_speed, _dir);
	}
}
	
