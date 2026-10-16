event_inherited();
self [$ "my_encounters"] ??= [];
self [$ "my_path"] ??= noone;

path_sample_precision = 0.05;
path_width = 3;

// Make path sprite
on_room_start = function() {
	path_asset = asset_get_index(my_path); // NOTE: Important stuff in Room Creation Code, so can't use create event. Should we use Variable Defintions?

	///@desc Make path sprite
	draw_set();
	var _surf = surface_create(1, 1);
	var _margin = 200; // Margin to stop clipping at edge of surface
	var _margin_h = _margin/2;

	var _len = path_get_length(path_asset);
	var _samples = ceil(_len * path_sample_precision);
	var _w = path_get_width(path_asset);
	var _h = path_get_height(path_asset);
	var _l = path_get_left(path_asset);
	var _t = path_get_top(path_asset);
	
	// Prep sprite surface
	surface_resize(_surf, _w + _margin, _h + _margin);
	var _surfw = surface_get_width(_surf);
	var _surfh = surface_get_height(_surf);	
	surface_set_target(_surf);
	draw_clear_alpha(c_white, 0);
	
	// Draw thin lines over path, visual
	var _x1 = path_get_x(path_asset, 0) - _l + _margin_h;
	var _y1 = path_get_y(path_asset, 0) - _t + _margin_h;	
	for (var s = 1; s <= _samples; s++) {
		var _pos = s / _samples;
		var _x2 = path_get_x(path_asset, _pos) - _l + _margin_h;
		var _y2 = path_get_y(path_asset, _pos) - _t + _margin_h;
		draw_line_width(_x1, _y1, _x2, _y2, path_width);
		_x1 = _x2;
		_y1 = _y2;	
	}
	sprite_index = sprite_create_from_surface(_surf, 0, 0, _surfw, _surfh, false, false, 0, 0);
	sprite_collision_mask(sprite_index, false, bboxmode_automatic, 0, 0, 0, 0, bboxkind_precise, 0);
	surface_reset_target();	

	// Move to top left of path position, accounting for sprite margin
	x = _l - _margin_h;
	y = _t - _margin_h; 

	// Note starting and ending map locations
	var _xs = path_get_x(path_asset, 0);
	var _ys = path_get_y(path_asset, 0);
	location_start = instance_position(_xs, _ys, obj_map_location);
	var _xe = path_get_x(path_asset, 1);
	var _ye = path_get_y(path_asset, 1);
	location_end = instance_position(_xe, _ye, obj_map_location);
}