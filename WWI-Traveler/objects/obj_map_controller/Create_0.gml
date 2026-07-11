show_debug_message("Map Controller created");

map_slot = -1;   // -1 = no slot open yet (blank canvas); press 0-9 to open a slot

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

edit_mode = true;
pointer = noone;

start_node = function(){
	// always start play on the first node (lowest node_id), regardless of selection
	var _valid_node = noone;
	with (obj_map_node){
		 if (_valid_node == noone || node_id < _valid_node.node_id) _valid_node = id;
	}

	return _valid_node;
}

enter_play_mode = function(){
	var _start = start_node();
	if (_start == noone){ edit_mode = true; return; }
	
	global.completed_nodes = {};
	
	mark_node_complete(_start.node_id);
	
	selected_node = noone;
	selected_path = noone;
	
	if (!instance_exists(pointer)){
		pointer = instance_create_layer(_start.x, _start.y, layer, obj_map_pointer);
	}
	pointer.set_node(_start);

	// remember this playthrough for the map -> combat/scene -> map return trip
	global.map_play_slot    = map_slot;
	global.map_current_node = _start.node_id;
}

exit_play_mode = function(){
        if (instance_exists(pointer)) instance_destroy(pointer);
        pointer = noone;
  }

// Return the path struct that directly connects two node ids, or noone if they aren't linked.
// (Returns the struct, not just true/false, so obstacle logic can read .obstacle later.)
get_path_between = function(_a, _b){
	for (var i = 0; i < array_length(path_line); i++)
	{
		if (path_line[i].a == _a && path_line[i].b == _b) || (path_line[i].a == _b && path_line[i].b == _a)
			return path_line[i];
	}
	return noone;
}

// Wipe the map back to a blank canvas (no nodes, no paths, ids reset).
clear_map = function(){
	with (obj_map_node) instance_destroy();
	path_line = [];
	next_node_id = 0;
	selected_node = noone;
	selected_path = noone;
	if (instance_exists(pointer)){ instance_destroy(pointer); pointer = noone; }
	edit_mode = true;
}

// Load a slot's file, or clear to a blank map if that slot has never been saved.
load_slot = function(_slot){
	var _data = load_map(map_file(_slot));
	if (_data == undefined){
		clear_map();      // empty slot -> fresh blank map
		return;
	}

	var _result  = apply_map(_data, layer);
	path_line    = _result.path_line;
	next_node_id = _result.next_node_id;

	selected_node = noone;
	selected_path = noone;
	if (instance_exists(pointer)){ instance_destroy(pointer); pointer = noone; }
	edit_mode = true;
}

// Remove a node and every path that touches it (no dangling edges left in path_line).
delete_node = function(_node){
	var _id = _node.node_id;
	for (var i = array_length(path_line) - 1; i >= 0; i--){   // backwards: array_delete shifts indices
		if (path_line[i].a == _id || path_line[i].b == _id){
			if (path_line[i] == selected_path) selected_path = noone;
			array_delete(path_line, i, 1);
		}
	}
	if (_node == selected_node) selected_node = noone;
	instance_destroy(_node);
}

// Remove a single path.
delete_path = function(_path){
	for (var i = 0; i < array_length(path_line); i++){
		if (path_line[i] == _path){ array_delete(path_line, i, 1); break; }
	}
	if (_path == selected_path) selected_path = noone;
}

// Coming back from combat/scene? Rebuild the played map and resume play on the last node.
if (global.map_resume){
	global.map_resume = false;

	map_slot = global.map_play_slot;
	if (map_slot != -1) load_slot(map_slot);          // rebuild the map that was in play

	var _resume_node = get_node(global.map_current_node);
	if (_resume_node != noone){
		edit_mode = false;                            // resume in Play, not Edit
		pointer = instance_create_layer(_resume_node.x, _resume_node.y, layer, obj_map_pointer);
		pointer.set_node(_resume_node);               // Resume from the last node you were at
	}
}