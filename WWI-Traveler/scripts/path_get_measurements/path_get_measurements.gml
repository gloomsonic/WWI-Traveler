// Lowest x value of the path points
function path_get_left(_path) {
	var _size = path_get_number(_path);
	var _left = path_get_point_x(_path, 0);
	for (var i = 1; i < _size; i++) {
		var _x = path_get_point_x(_path, i);
		if (_x >= _left) continue;
		_left = _x;
	}
	return _left;
}

// Lowest y value of the path points
function path_get_top(_path) {
	var _size = path_get_number(_path);
	var _top = path_get_point_y(_path, 0);
	for (var i = 1; i < _size; i++) {
		var _y = path_get_point_y(_path, i);
		if (_y >= _top) continue;
		_top = _y;
	}
	return _top;
}

// Highest x value of the path points
function path_get_right(_path) {
	var _size = path_get_number(_path);
	var _right = path_get_point_x(_path, 0);
	for (var i = 1; i < _size; i++) {
		var _x = path_get_point_x(_path, i);
		if (_x <= _right) continue;
		_right = _x;
	}
	return _right;
}

// Highest y value of the path points
function path_get_bottom(_path) {
	var _size = path_get_number(_path);
	var _bottom = path_get_point_y(_path, 0);
	for (var i = 1; i < _size; i++) {
		var _y = path_get_point_y(_path, i);
		if (_y <= _bottom) continue;
		_bottom = _y;
	}
	return _bottom;
}

// Path right minus path left
function path_get_width(_path) {
	return path_get_right(_path) - path_get_left(_path);
}

// Path bottom minus path top
function path_get_height(_path) {
	return path_get_bottom(_path) - path_get_top(_path);
}