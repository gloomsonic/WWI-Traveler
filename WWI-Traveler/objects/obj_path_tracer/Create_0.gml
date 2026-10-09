path_sample_precision = 0.05;
paths = asset_get_ids(asset_path);
draw_set();

// Sample paths to draw them to surfaces, then sprites
for (var i = 0; i < array_length(paths); i++) {
	var _path = paths[i];
	var _len = path_get_length(_path);
	var _samples = ceil(_len * path_sample_precision);
	
	// Prep surface
	var _w = path_get_width(_path);
	var _h = path_get_height(_path);
	var _surf = surface_create(_w, _h)
	surface_set_target(_surf);
	draw_clear_alpha(c_white, 0);	
	
	// Draw lines over the path, top left of surface
	var _l = path_get_left(_path);
	var _t = path_get_top(_path);
	var _x1 = path_get_x(_path, 0) - _l;
	var _y1 = path_get_y(_path, 0) - _t;	
	for (var s = 1; s <= _samples; s++) {
		var _pos = s / _samples;
		var _x2 = path_get_x(_path, _pos) - _l;
		var _y2 = path_get_y(_path, _pos) - _t;
		draw_line_width(_x1, _y1, _x2, _y2, 3);
		_x1 = _x2;
		_y1 = _y2;	
	}
	surface_reset_target();
	
	// Make sprites out of the surfaces
	var _w = surface_get_width(_surf);
	var _h = surface_get_height(_surf);
	var _spr = sprite_create_from_surface(_surf, 0, 0, _w, _h, false, false, 0, 0);
	sprite_collision_mask(_spr, false, bboxmode_automatic, 0, 0, 0, 0, bboxkind_precise, 0);
	
	// Object to draw the path
	instance_create_depth(_l, _t, depth, obj_map_path, { 
		sprite_index: _spr,
		mask_index: _spr,
	});
}
