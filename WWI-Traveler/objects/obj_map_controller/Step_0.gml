// Toggle edit and play mode
if (keyboard_check_pressed(vk_tab)){
	if (edit_mode){
		edit_mode = false;
		enter_play_mode();   // flips back to Edit if the map has no nodes
	} else {
		edit_mode = true;
		exit_play_mode();
	}
}

// TO BE USED LATER WHEN WE START LOADING RANDOM MAPS! F8 IS A DEBUG TOOL
if (keyboard_check_pressed(vk_f8)){
    var _slot = random_saved_slot();
    if (_slot != -1){
            map_slot = _slot;
            load_slot(_slot);      // load_slot lands in Edit; F8 is a play start...
            edit_mode = false;     // ...so drop into Play on the freshly loaded map
            enter_play_mode();
    }
}

// TODO: I don't think we should use 'touch_object' this way. It's intended to be called within a cursor object's states
var _touch = obj_map_cursor.touch_object(obj_map_node);

if (edit_mode){

	// --- authoring: save / load only while editing ---

	// open a slot 0-9 with the number keys: loads that slot's map, or a blank canvas if it's empty
	for (var _k = 0; _k <= 9; _k++){
		if (keyboard_check_pressed(ord(string(_k))) && _k != map_slot){
			map_slot = _k;
			load_slot(_k);
		}
	}

	// save the current map to the active slot (needs an open slot AND at least one node)
	if (keyboard_check_pressed(vk_f5) && map_slot != -1 && instance_number(obj_map_node) > 0){
		save_map(map_file(map_slot), path_line, next_node_id);
	}

	// Remember the node that was pressed (or noone if pressed on empty space)
	if (mouse_check_button_pressed(mb_left)){
		link_first_node = _touch.inst;
	}


	// Handles the mouse gestures when working with nodes and paths. Differentiates between clicking and dragging, basically.
	if (mouse_check_button_released(mb_left)){
		var link_second_node = _touch.inst;

		if (link_first_node != noone && link_second_node != noone && link_second_node != link_first_node)
		{
			// dragged from one node to a different node -> connect / disconnect
			toggle_path_line(link_first_node.node_id, link_second_node.node_id);
		}
		else if (link_first_node != noone && link_second_node == link_first_node)
		{
			// pressed and released on the same node -> select it
			selected_node = link_second_node;
			selected_path = noone;
		}
		else if (link_first_node == noone && link_second_node == noone)
		{
			var _clicked_path = get_path_at(mouse_x, mouse_y);

			if (_clicked_path != noone)
			{
				// clicked near a line -> select that path
				selected_path = _clicked_path;
				selected_node = noone;
			}
			else if (selected_node != noone || selected_path != noone)
			{
				// something was selected and we clicked empty space -> just deselect
				selected_node = noone;
				selected_path = noone;
			}
			else
			{
				// nothing selected + empty space -> create a new node here
				var _new_node = instance_create_layer(mouse_x, mouse_y, layer, obj_map_node);
				_new_node.node_id = next_node_id;
				next_node_id += 1;
				selected_node = _new_node;
				selected_path = noone;
			}
		}
		else if (link_first_node == noone && link_second_node != noone)
		{
			// pressed empty, released on a node -> select it
			selected_node = link_second_node;
			selected_path = noone;
		}

		link_first_node = noone;
	}

	// Change the color of a node based on its selected feature
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

	else if (selected_path != noone) {
		var _count = array_length(MAP_PATH_OBSTACLES);

		if (keyboard_check_pressed(ord("E")))
		{
			selected_path.obstacle = (selected_path.obstacle + 1) % _count;
		}
		if (keyboard_check_pressed(ord("Q")))
		{
			selected_path.obstacle = (selected_path.obstacle - 1 + _count) % _count;
		}
	}

	// Delete the selected node (and its paths) or the selected path
	if (keyboard_check_pressed(vk_delete) || keyboard_check_pressed(vk_backspace)){
		if (selected_node != noone && instance_exists(selected_node)){
			delete_node(selected_node);
		}
		else if (selected_path != noone){
			delete_path(selected_path);
		}
	}

	// Right-click directly on a node (or path) to delete it
	if (mouse_check_button_pressed(mb_right)){
		if (_touch.inst != noone){
			delete_node(_touch.inst);
		}
		else {
			var _path = get_path_at(mouse_x, mouse_y);
			if (_path != noone) delete_path(_path);
		}
	}

}
else {
	// Play mode: click a node connected to the pointer's current node to travel there.
	if (mouse_check_button_pressed(mb_left) && _touch.inst != noone
		&& instance_exists(pointer) && pointer.is_idle())
	{
		var _path = get_path_between(pointer.current_node_id, _touch.inst.node_id);
		if (_path != noone) pointer.travel_to(_touch.inst, _path);
	}
}
