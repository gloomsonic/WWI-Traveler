draw_set(, fnt_droid_serif_30, fa_center, fa_bottom);
draw_self_ext();
var _y = BBOX_T;

// Draw open path indeces
for (var i = 0; i < array_length(open_paths); i++) {
	var _path = open_paths[i];
	var _str = string(_path);
	_str = string_split(_str, " ")[2];
	draw_text(x, _y, _str);
	_y -= font_height();
}