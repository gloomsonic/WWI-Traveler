path_sample_precision = 0.05;
paths = asset_get_ids(asset_path);
path_sprites = [];

path_width = 3;
//mask_width = 100;

draw_set();
var _surf = surface_create(1, 1);
//var _surf_mask = surface_create(1, 1);
var _margin = 200; // Margin to stop clipping at edge of surface
var _margin_h = _margin/2;

// Sample paths to draw them to surfaces, then sprites
for (var i = 0; i < array_length(paths); i++) {
	var _path = paths[i];
	var _len = path_get_length(_path);
	var _samples = ceil(_len * path_sample_precision);
	log(_samples);
	var _w = path_get_width(_path);
	var _h = path_get_height(_path);
	var _l = path_get_left(_path);
	var _t = path_get_top(_path);	
	
	// Prep sprite surface
	surface_resize(_surf, _w + _margin, _h + _margin);
	var _surfw = surface_get_width(_surf);
	var _surfh = surface_get_height(_surf);	
	surface_set_target(_surf);
	draw_clear_alpha(c_white, 0);
	
	// Draw thin lines over path, visual
	var _x1 = path_get_x(_path, 0) - _l + _margin_h;
	var _y1 = path_get_y(_path, 0) - _t + _margin_h;	
	for (var s = 1; s <= _samples; s++) {
		var _pos = s / _samples;
		var _x2 = path_get_x(_path, _pos) - _l + _margin_h;
		var _y2 = path_get_y(_path, _pos) - _t + _margin_h;
		draw_line_width(_x1, _y1, _x2, _y2, path_width);
		_x1 = _x2;
		_y1 = _y2;	
	}
	var _spr = sprite_create_from_surface(_surf, 0, 0, _surfw, _surfh, false, false, 0, 0);
	sprite_collision_mask(_spr, false, bboxmode_automatic, 0, 0, 0, 0, bboxkind_precise, 0);
	surface_reset_target();	
	
	//// Prep mask surface
	//surface_resize(_surf_mask, _w + _margin, _h + _margin);
	//var _surf_maskw = surface_get_width(_surf_mask);
	//var _surf_maskh = surface_get_height(_surf_mask);	
	//surface_set_target(_surf_mask);
	//draw_clear_alpha(c_white, 0);		
	
	//// Draw thick lines over path, bbox
	//var _x1 = path_get_x(_path, 0) - _l + _margin_h;
	//var _y1 = path_get_y(_path, 0) - _t + _margin_h;	
	//for (var s = 1; s <= _samples; s++) {
	//	var _pos = s / _samples;
	//	var _x2 = path_get_x(_path, _pos) - _l + _margin_h;
	//	var _y2 = path_get_y(_path, _pos) - _t + _margin_h;
	//	draw_line_width(_x1, _y1, _x2, _y2, mask_width);
	//	_x1 = _x2;
	//	_y1 = _y2;	
	//}
	//var _mask = sprite_create_from_surface(_surf_mask, 0, 0, _surf_maskw, _surf_maskh, false, true, 0, 0);
	//sprite_collision_mask(_mask, false, bboxmode_automatic, 0, 0, 0, 0, bboxkind_precise, 0);
	//surface_reset_target();
	
	// Object to draw the path
	instance_create_depth(_l - _margin_h, _t - _margin_h, depth, obj_map_path, { 
		sprite_index: _spr,
		//mask_index: _mask,
	});
	
	// For cleanup
	array_push(path_sprites, _spr);	
	//array_push(path_sprites, _mask);	
}