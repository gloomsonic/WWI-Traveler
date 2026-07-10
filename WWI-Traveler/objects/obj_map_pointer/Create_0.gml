image_xscale = MAP_NODE_DIAMETER / sprite_get_width(sprite_index);
image_yscale = image_xscale;
depth = -100;


current_node_id = -1;
target_node  = noone;
travel_path  = noone;
move_speed   = 6;

set_node = function(_node) {
	x = _node.x;
	y = _node.y;
	current_node_id = _node.node_id;
	target_node = noone;
	travel_path = noone;
	
}

travel_to = function(_node, _path){
	target_node = _node;
	travel_path = _path;
}

is_idle = function(){
        return target_node == noone;
}




