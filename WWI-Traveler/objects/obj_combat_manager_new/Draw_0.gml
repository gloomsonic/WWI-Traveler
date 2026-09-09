draw_set();
var _x = 0;
var _y = ROOM_H_H;
var _size = array_length(combat_log);
for (var i = _size-1; i >= 0; i--) {
	var _line = combat_log[i];
	draw_text(_x, _y, _line);
	_y -= font_height();
}