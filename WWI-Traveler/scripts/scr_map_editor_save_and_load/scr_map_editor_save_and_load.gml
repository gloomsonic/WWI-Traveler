function map_to_struct(_path_line, _next_node_id){
	var _nodes = [];
	with(obj_map_node){
		array_push(_nodes, {id: node_id, x: x, y: y, feature: feature });
	}
	
	var _paths = [];
	for(var i = 0; i < array_length(_path_line); i++ ){
		array_push(_paths, { a: _path_line[i].a, b: _path_line[i].b, obstacle: _path_line[i].obstacle });
	}
	
	return { nodes: _nodes, paths: _paths, next_node_id: _next_node_id };
}

// Slot filename, namespaced by the current room so each map room keeps its own 10 slots.
// e.g. in rm_map_editor -> "rm_map_editor_0.json"; in rm_map_editor_forest -> "rm_map_editor_forest_0.json".
function map_file(_slot){
        return room_get_name(room) + "_" + string(_slot) + ".json";
}

function save_map(_filename, _path_line, _next_node_id){
	var _json = json_stringify(map_to_struct(_path_line, _next_node_id));
	var _file = file_text_open_write(_filename);
	file_text_write_string(_file, _json);
    file_text_close(_file);
    show_debug_message("Saved map -> " + _filename);
}

function load_map (_filename){
	if (!file_exists(_filename)) return undefined;
	
	var _file = file_text_open_read(_filename);
    var _json = file_text_read_string(_file);
	file_text_close(_file);
	
	return json_parse(_json);	
}

function apply_map(_data, _layer){
	// clear the live map
	with (obj_map_node) instance_destroy();

	// recreate nodes
	for (var i = 0; i < array_length(_data.nodes); i++){
	        var _n = _data.nodes[i];
	        var _inst = instance_create_layer(_n.x, _n.y, _layer, obj_map_node);
	        _inst.node_id     = _n.id;
	        _inst.feature     = _n.feature;
	        _inst.image_blend = node_feature_color(_n.feature);
	}

	// rebuild the path list (copy each struct so we own fresh ones)
	var _paths = [];
	for (var i = 0; i < array_length(_data.paths); i++){
	        var _p = _data.paths[i];
	        array_push(_paths, { a: _p.a, b: _p.b, obstacle: _p.obstacle });
	}

	return { path_line: _paths, next_node_id: _data.next_node_id };
}

function random_saved_slot(){
    var _available = [];
    for (var _slot = 0; _slot <= 9; _slot++){
            if (file_exists(map_file(_slot))) array_push(_available, _slot);
    }       
    if (array_length(_available) == 0) return -1;
        
    return _available[irandom(array_length(_available) - 1)];
}