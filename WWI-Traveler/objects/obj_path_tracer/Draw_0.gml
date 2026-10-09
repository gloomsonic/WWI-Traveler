draw_set();
for (var i = 0; i < array_length(path_structs); i++) {
	var _data = path_structs[i];
	var _spr = _data.sprite_index;
	var _x = _data.x;
	var _y = _data.y;
	draw_sprite(_spr, 0, _x, _y);
}

//draw_set();
//var _x1, _y1, _x2, _y2, _l, _t, _w, _h;

//// Measure each path to determine sample count
//for (var i = 0; i < array_length(paths); i++) {
//	var _path = paths[i];
//	var _len = path_get_length(_path);
//	var _samples = ceil(_len * precision);
	
//	// Prep surface
//	if (!surface_exists(path_surfaces[i])) 
//		path_surfaces[i] = path_surface_refresh(_path);
//	surface_set_target(path_surfaces[i]);
//	draw_clear_alpha(c_white, 0);
	
//	_l = path_get_left(_path);
//	_t = path_get_top(_path);
//	_x1 = path_get_x(_path, 0) - _l;
//	_y1 = path_get_y(_path, 0) - _t;	
	
//	// Draw lines over the path
//	for (var s = 1; s <= _samples; s++) {
//		var _pos = s / _samples;
//		_x2 = path_get_x(_path, _pos) - _l;
//		_y2 = path_get_y(_path, _pos) - _t;
//		draw_line_width(_x1, _y1, _x2, _y2, 3);
//		_x1 = _x2;
//		_y1 = _y2;	
//	}
//	surface_reset_target();
	
//	var _w = surface_get_width(path_surfaces[i]);
//	var _h = surface_get_height(path_surfaces[i]);
//	path_sprites[i] = sprite_create_from_surface(path_surfaces[i], 0, 0, _w, _h, false, false, 0, 0);
//	draw_sprite(path_sprites[i], 0, _l, _t);
//}













// OLD WAY:
	//// Draw lines over the path
	//for (var s = 1; s <= _samples; s++) {
	//	var _pos = s / _samples;
	//	_x2 = path_get_x(_path, _pos);
	//	_y2 = path_get_y(_path, _pos);
	//	draw_line_width(_x1, _y1, _x2, _y2, 3);
	//	_x1 = _x2;
	//	_y1 = _y2;	
	//}
	
	//draw_surface(path_surfaces[i], _l, _t);	