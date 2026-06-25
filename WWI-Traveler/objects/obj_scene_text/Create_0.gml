draw_set();

line_spacing = 1.4;
l_margin = ROOM_W_H - LINE_W_H;

characters_opaque_count = 0;
fade_values = [];
fade_spd = 0.05;
fades = [];

char_spd = 2;
scroll_spd = font_height() * line_spacing;
awaiting_input = false;

//
char_get_fade = function(_count, _end) {
	if (_count < characters_opaque_count) return 1.0;
	var _dif = _end - _count;
	var _alpha = fade_values[array_length(fade_values) - _dif];
	return _alpha;
}

//
next_wait_phrase = function() {
	for (var p = 0; p < array_length(SCENES.ambulance); p++) {
		var _phrase = SCENES.ambulance[p];
		if (_phrase != "<w>") continue;
		return p;
	}
}