draw_set();
var _x1, _y1, _x2, _y2;

// Measure each path to determine sample count
for (var i = 0; i < array_length(paths); i++) {
	var _path = paths[i];
	var _len = path_get_length(_path);
	var _samples = ceil(_len * precision);
	_x1 = path_get_x(_path, 0);
	_y1 = path_get_y(_path, 0);
	
	// Draw lines over the path
	for (var s = 1; s <= _samples; s++) {
		var _pos = s / _samples;
		_x2 = path_get_x(_path, _pos);
		_y2 = path_get_y(_path, _pos);
		draw_line_width(_x1, _y1, _x2, _y2, 3);
		_x1 = _x2;
		_y1 = _y2;	
	}
}
