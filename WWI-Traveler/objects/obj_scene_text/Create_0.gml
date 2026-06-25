draw_set();

line_spacing = 1.4;
l_margin = ROOM_W_H - LINE_W_H;

char_spd = 6;
scroll_spd = font_height() * line_spacing;
awaiting_input = false;

fade_spd = 0.04;
fade_values = [];
characters_opaque_count = 0;

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

//
truncate_fades = function(_count, _end) {
	if (_end < _count) return;
	var _dif = _end - _count;
	var _fades_count = array_length(fade_values);
	array_delete(fade_values, _fades_count - _dif, _dif-1);
}