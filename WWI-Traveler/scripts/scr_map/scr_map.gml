#macro MAP_NODE_DIAMETER 32
#macro MAP_NODE_FEATURES ["Plain", "City", "Mountain", "Swamp", "Forest", "River" ]
#macro MAP_PATH_OBSTACLES ["None", "River", "Mountain Pass", "Ravine", "Forest"]
#macro MAP_PATH_SELECT_RADIUS 12 // How close the mouse as to be to a path to click it


// Returns a color representing a geographical feature of a node
function node_feature_color(_index){
	switch(_index)
	{
		case 1:  return c_red;		// city
		case 2:  return c_gray;		// mountain
		case 3:  return c_purple;	// swamp
		case 4:  return c_green;	// forest
		case 5:  return c_aqua;		// river
		default: return c_white;	// plain	
	}
}

function path_obstacle_color(_index){
	switch(_index)
	{
		case 1:  return c_aqua;		// river
		case 2:  return c_gray;		// mountain pass
		case 3:  return c_orange;	// ravine
		case 4:  return c_green;	// forest
		default: return c_white;	// none	
	}
}

function distance_point_to_segment(_point_x, _point_y, _node_A_x, _node_A_y, _node_B_x, _node_B_y){
	var _distance_x = _node_B_x - _node_A_x;
	var _distance_y = _node_B_y - _node_A_y;
	var _len_sq = _distance_x * _distance_x + _distance_y * _distance_y;
	
	if (_len_sq == 0) return point_distance(_point_x, _point_y, _node_A_x, _node_A_y); // Segment single point
	
	var _t = ((_point_x - _node_A_x) * _distance_x + (_point_y - _node_A_y) * _distance_y) / _len_sq;
	_t = clamp(_t, 0, 1);
	
	var _clamped_x = _node_A_x + _t * _distance_x;
	var _clamped_y = _node_A_y + _t * _distance_y;
	
	return point_distance(_point_x, _point_y, _clamped_x, _clamped_y);
}

function mark_node_complete(_id){
	global.completed_nodes[$ string(_id)] = true;
}

function node_is_complete(_id){
	return variable_struct_exists(global.completed_nodes, string(_id));
}