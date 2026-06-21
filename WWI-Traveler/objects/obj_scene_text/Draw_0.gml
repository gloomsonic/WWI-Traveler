draw_set();
var _x = ROOM_W_H - LINE_W_H;
var _y = 0;

for (var i = 0; i < array_length(SCENES.ambulance); i++) {
	var _line = SCENES.ambulance[i];
	draw_text(_x, _y, _line);
	_y += font_height();
}

draw_circle(x, y, 32, false);