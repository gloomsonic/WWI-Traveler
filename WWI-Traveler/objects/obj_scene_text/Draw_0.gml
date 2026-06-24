draw_set();

var _l_margin = ROOM_W_H - LINE_W_H;
var _x = _l_margin;
var _y = 0;
var _char_count = 0;

for (var p = 0; p < array_length(SCENES.ambulance); p++) {
	var _phrase = SCENES.ambulance[p];
	var _char_count_plus = _char_count + string_length(_phrase);
	
	// Stop at onscreen count
	if (_char_count_plus >= characters_onscreen_count) {

		// Draw phrase character-by-character
		for (var c = 1; c + _char_count <= characters_onscreen_count; c++) {
			var _char = string_char_at(_phrase, c)
			draw_text(_x, _y, _char);
			_x += string_width(_char);
		}
		break;
	} else {
		_char_count = _char_count_plus;
		draw_text(_x, _y, _phrase);
	}
	
	// Carriage return
	_x = _l_margin;
	_y += font_height() * line_spacing;
}

//// Draw one line at a time
//for (var l = 0; l < array_length(SCENES.ambulance); l++) {
//	var _line = SCENES.ambulance[l];
//	var _line_length = string_length(_line);
	
//	// Draw one character of the line at a time
//	for (var c = 1; c <= _line_length; c++) {
		
//		// Stop at onscreen count
//		if (_char_count >= characters_onscreen_count)
//			break;
		
//		// Fade in latest characters
//		draw_set();
//		var _char_dif = abs(characters_onscreen_count - _char_count);
//		var _fades_count = array_length(fades);
//		if (_char_dif <= _fades_count) {
//			var _index = _fades_count - _char_dif; // If array_length == 10, 7th from the newest character = 3rd value on the fades array
//			var _alpha = fades[_index];
//			draw_set(,,,, _alpha);
//		}
		
//		// Draw next character
//		var _char = string_char_at(_line, c);
//		draw_text(_x, _y, _char);
//		_x += string_width(_char);
//		_char_count += 1; // Won't index correctly if above _char_dif
//	}
	
//	// Carriage return
//	_x = _l_margin;
//	_y += font_height() * line_spacing;
//}

// Scroll indicator
draw_set();
var _ydif = y - 0;
draw_circle(x, ROOM_H_H + _ydif, 32, false);