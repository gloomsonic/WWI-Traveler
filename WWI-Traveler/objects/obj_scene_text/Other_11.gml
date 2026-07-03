///@desc methods Draw

//
draw_phrases = function() {
	draw_set();
	var _x = l_margin;
	var _y = 0;
	var _char_count = 0;
	var _char_count_end = characters_opaque_count + array_length(fade_values);

	// Draw phrases
	for (var p = 0; p < array_length(SCENES.ambulance.story); p++) {
		var _phrase = SCENES.ambulance.story[p];
		var _phrase_len = string_length(_phrase);
		var _char_count_plus = _char_count + _phrase_len;
	
		// Paragraph break
		if (_phrase == "<p>") {
			_y += font_height() * line_spacing;
			_y += font_height() * line_spacing;
			continue;
		}
	
		// Await input
		if (_phrase == "<w>") {
			truncate_fades(_char_count, _char_count_end);
			states.queue(State.waiting);
			break;
		}
	
		// line break
		if (_phrase == "<n>") {
			_y += font_height() * line_spacing;
			continue;
		}
	
		// Draw last phrase(s) character-by-character
		if (_char_count_plus >= characters_opaque_count) {
		
			// NOTE: will crash if nothing on fade_values array
			// Draw each character with fade
			for (var c = 1; c <= _phrase_len; c++) {
				var _char = string_char_at(_phrase, c);
				draw_set_alpha(char_get_fade(_char_count, _char_count_end));
				draw_text(_x, _y, _char);
				_x += string_width(_char);
				_char_count++;
			
				// Don't pass the end
				if (_char_count >= _char_count_end) break;
			}
			if (_char_count >= _char_count_end) break;
		
			// Carriage return
			_x = l_margin;
			continue;	
		}
	
		// Draw phrase normally
		_char_count = _char_count_plus;
		draw_text(_x, _y, _phrase);
		if (_char_count >= _char_count_end) break;

		// Carriage return
		_x = l_margin;
	}
	return _y;
}

//
draw_choices = function(_y) {
	draw_set(,,, fa_middle);
	_y += choice_break;
	
	for (var c = 0; c < array_length(SCENES.ambulance.choices); c++) {
		//draw_rectangle(540, _y, ROOM_W-540, _y + font_height(), true);
		draw_circle(l_margin - 128, _y, 16, true);
		draw_text(l_margin, _y, SCENES.ambulance.choices[c]);
		_y += font_height() * choice_spacing;
	}
}