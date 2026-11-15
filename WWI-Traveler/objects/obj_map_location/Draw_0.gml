draw_set(, fnt_droid_serif_30, fa_center, fa_bottom);
if (LOCATION_CURRENT == id)
	draw_self_ext(,,,,,,, c_blue);
else
	draw_self_ext();

// Draw open path indeces
draw_set(, fnt_droid_serif_30, fa_center, fa_bottom);
var _y = BBOX_T;
for (var i = 0; i < array_length(open_paths); i++) {
	var _path = open_paths[i];
	var _str = string(_path);
	_str = string_split(_str, " ")[2];
	draw_text(x, _y, _str);
	_y -= font_height();
}

draw_set(, fnt_droid_serif_30, fa_center, fa_top);
var _y = BBOX_B;
draw_text(x, _y, $"x:{x} y:{y}");