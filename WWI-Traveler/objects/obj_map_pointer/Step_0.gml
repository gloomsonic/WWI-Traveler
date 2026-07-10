if (target_node != noone && instance_exists(target_node)){
	if (point_distance(x, y, target_node.x, target_node.y) <= move_speed){
		// arrived — snap on and go idle
		x = target_node.x;
		y = target_node.y;
		current_node_id = target_node.node_id;
		target_node = noone;
		travel_path = noone;

		// reached a node -> drop into combat (placeholder landing on a node)
		room_goto(rm_combat);
	}
	else {
		var _dir = point_direction(x, y, target_node.x, target_node.y);
        x += lengthdir_x(move_speed, _dir);
        y += lengthdir_y(move_speed, _dir);
	}
}
	
