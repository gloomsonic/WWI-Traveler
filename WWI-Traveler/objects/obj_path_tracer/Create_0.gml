precision = 0.05;
paths = asset_get_ids(asset_path);
path_structs = array_create(array_length(paths));
path_surfaces = array_create(array_length(paths));
path_surface_refresh = function(_path) {
	var _w = path_get_width(_path);
	var _h = path_get_height(_path);		
	return surface_create(_w, _h);	
}
for (var i = 0; i < array_length(paths); i++) {
	var _path = paths[i];
	path_surfaces[i] = path_surface_refresh(_path);
}

// TODO: 
/* 
+ draw each path to a cleared surface
+ draw lines to create sprite from surface, really wide so they're easy to mouse over
+ set its bbox to precise
+ create an object with this sprite as its sprite_index and bbox
+ draw those objects instead of drawing lines every frame
*/
//var _sprite = sprite_create_from_surface()
//sprite_set_bbox_mode(_sprite, bboxkind_precise);

draw_set();
var _x1, _y1, _x2, _y2, _l, _t, _w, _h;

// Measure each path to determine sample count, then draw each path via lines into a surface followed by a sprite 
for (var i = 0; i < array_length(paths); i++) {
	var _path = paths[i];
	var _len = path_get_length(_path);
	var _samples = ceil(_len * precision);
	
	// Prep surface
	if (!surface_exists(path_surfaces[i])) 
		path_surfaces[i] = path_surface_refresh(_path);
	surface_set_target(path_surfaces[i]);
	draw_clear_alpha(c_white, 0);
	
	_l = path_get_left(_path);
	_t = path_get_top(_path);
	_x1 = path_get_x(_path, 0) - _l;
	_y1 = path_get_y(_path, 0) - _t;	
	
	// Draw lines over the path
	for (var s = 1; s <= _samples; s++) {
		var _pos = s / _samples;
		_x2 = path_get_x(_path, _pos) - _l;
		_y2 = path_get_y(_path, _pos) - _t;
		draw_line_width(_x1, _y1, _x2, _y2, 3);
		_x1 = _x2;
		_y1 = _y2;	
	}
	surface_reset_target();
	
	// Make sprites out of the surfaces
	var _w = surface_get_width(path_surfaces[i]);
	var _h = surface_get_height(path_surfaces[i]);
	var _spr = sprite_create_from_surface(path_surfaces[i], 0, 0, _w, _h, false, false, 0, 0);
	path_structs[i] = {
		sprite_index: _spr,
		x: _l,
		y: _t,
	}
	//draw_sprite(path_sprites[i], 0, _l, _t);
}
