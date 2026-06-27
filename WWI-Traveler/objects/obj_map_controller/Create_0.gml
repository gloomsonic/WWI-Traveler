show_debug_message("Map Controller created");

selected_node = noone;
next_node_id = 0;

connecting_line = []; // Each entry will be two nodes { a , b } : this represents a connection between two node ids.

link_first_node = noone;

toggle_connection = function(_a, _b){
	for (var i = 0; i < array_length(connecting_line); i++)
	{
		if (connecting_line[i].a == _a && connecting_line[i].b == _b) || (connecting_line[i].a == _b && connecting_line[i].b == _a)
		{
			array_delete(connecting_line, i, 1); // If already linked, remove the edge.
			return;
		}
	}
	
	array_push(connecting_line, { a: _a , b: _b }); // If not linked, add a new edge.
}

// Returns a node instance
get_node_by_id = function(_id){
	with(obj_map_node) 
	{
		if (node_id == _id) return id;
	}
	return noone;
}