image_xscale = 0.7;
image_yscale = 0.7;

open_paths = [];
var _paths = asset_get_ids(asset_path);

// Store the paths that *start* on top of me
for (var i = 0; i < array_length(_paths); i++) {
	var _path = _paths[i];
	var _x = path_get_x(_path, 0);
	var _y = path_get_y(_path, 0);
	if (!position_meeting(_x, _y, id)) continue;
	array_push(open_paths, _path);
}

// Make current location's open paths touchable
on_room_start = function() {
	if (LOCATION_CURRENT != id) exit;
	with (obj_map_path) {
		if (array_get_index(other.open_paths, path_asset) == -1) continue;
		par_mouse_cursor.add_touchable(id);
	}
}