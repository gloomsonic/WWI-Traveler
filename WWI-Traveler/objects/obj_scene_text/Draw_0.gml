draw_set();

var _l_margin = ROOM_W_H - LINE_W_H;
var _x = _l_margin;
var _y = 0;
var _char_count = 0;

// Draw one line at a time
for (var l = 0; l < array_length(SCENES.ambulance); l++) {
	var _line = SCENES.ambulance[l];
	var _line_length = string_length(_line);
	
	// Draw one character of the line at a time
	for (var c = 1; c <= _line_length; c++) {
		
		// Stop at onscreen count
		if (_char_count >= characters_onscreen)
			break;
			
		//// Fade last 10 characters
		//var _char_dif = characters_onscreen - _char_count;
		//var _char_alpha = lerp(0.1, 1.0, _char_dif / 10);
		//draw_set(,,,, _char_alpha);
		
		// Draw next character
		var _char = string_char_at(_line, c);
		draw_text(_x, _y, _char);
		_x += string_width(_char);
		_char_count += 1;
	}
	
	// Carriage return
	_x = _l_margin;
	_y += font_height() * line_spacing;
}

// Scroll indicator
draw_set();
var _ydif = y - 0;
draw_circle(x, ROOM_H_H + _ydif, 32, false);