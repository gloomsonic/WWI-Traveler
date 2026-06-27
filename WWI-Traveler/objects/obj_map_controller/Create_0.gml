show_debug_message("Map Controller created");

selected_node = noone;
selected_path = noone;

next_node_id = 0;

path_line = []; // Each entry will contain two nodes { a , b } : this represents a connection between two node ids.

link_first_node = noone;

toggle_path_line = function(_a, _b){
	for (var i = 0; i < array_length(path_line); i++)
	{
		if (path_line[i].a == _a && path_line[i].b == _b) || (path_line[i].a == _b && path_line[i].b == _a)
		{
			if (path_line[i] == selected_path) selected_path = noone;
			array_delete(path_line, i, 1); // If already linked, remove the edge.
			return;
		}
	}
	
	array_push(path_line, { a: _a , b: _b, obstacle: 0 }); // If not linked, add a new path.
}

// Returns a node instance
get_node = function(_id){
	with(obj_map_node) 
	{
		if (node_id == _id) return id;
	}
	return noone;
}

get_path_at = function(_point_x, _point_y){
	var _closest_path = noone;
	var _closest_distance = MAP_PATH_SELECT_RADIUS;
	
	for (var i = 0; i < array_length(path_line); i++)
	{
		var _a = get_node(path_line[i].a);
		var _b = get_node(path_line[i].b);
		if (_a == noone || _b == noone) continue;
		
		var _distance = distance_point_to_segment(_point_x, _point_y, _a.x, _a.y, _b.x, _b.y)
		if (_distance < _closest_distance)
		{
			_closest_distance = _distance;
			_closest_path = path_line[i];
		}
	}
	
	return _closest_path;
}