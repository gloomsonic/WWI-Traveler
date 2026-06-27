var _touch = obj_mouse_cursor.touch_object(obj_map_node);

// Remember the node that was pressed (or noone if pressed on empty space)
if (mouse_check_button_pressed(mb_left)){
	link_first_node = _touch.inst;
}


// Handles the mouse gestures when working with nodes. Differentiates between clicking and dragging, basically.
if (mouse_check_button_released(mb_left)){
	var _link_to_second_node = _touch.inst;

	if (link_first_node != noone && _link_to_second_node != noone && _link_to_second_node != link_first_node)
	{
		// dragged from one node to a different node -> connect / disconnect
		toggle_edge(link_first_node.node_id, _link_to_second_node.node_id);
	}
	else if (link_first_node != noone && _link_to_second_node == link_first_node)
	{
		// pressed and released on the same node -> select it
		selected_node = _link_to_second_node;
	}
	else if (link_first_node == noone && _link_to_second_node == noone)
	{
		// pressed and released on empty space -> create a new node here
		var _new_node = instance_create_layer(mouse_x, mouse_y, layer, obj_map_node);
		_new_node.node_id = next_node_id;
		next_node_id += 1;
		selected_node = _new_node;
	}
	else if (link_first_node == noone && _link_to_second_node != noone)
	{
		// pressed empty, released on a node -> select it
		selected_node = _link_to_second_node;
	}

	link_first_node = noone;
}

if (selected_node != noone && instance_exists(selected_node)){
	var _count = array_length(MAP_NODE_FEATURES);
	if (keyboard_check_pressed(ord("E")))
	{
		selected_node.feature = (selected_node.feature + 1) % _count;
		selected_node.image_blend = node_feature_color(selected_node.feature);
	}
	if (keyboard_check_pressed(ord("Q")))
	{
		selected_node.feature = (selected_node.feature - 1 + _count) % _count;
		selected_node.image_blend = node_feature_color(selected_node.feature);
	}
}
