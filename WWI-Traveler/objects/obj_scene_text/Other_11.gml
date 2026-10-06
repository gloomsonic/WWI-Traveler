///@desc methods Draw

// Draw the story text
draw_phrases = function() {
	draw_set(c_white, font);
	var _x = l_margin;
	var _y = 0;
	var _char_count = 0;
	var _char_count_end = characters_opaque_count + array_length(fade_values);

	// Draw phrases
	for (var p = 0; p < array_length(my_scene.story); p++) {
		var _phrase = my_scene.story[p];
		var _phrase_len = string_length(_phrase);
		var _char_count_plus = _char_count + _phrase_len;
	
		// TODO: functionize these 
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
	
		// Line break
		if (_phrase == "<n>") {
			_y += font_height() * line_spacing;
			continue;
		}
		
		// Switch to italic
		if (_phrase == "<i>") {
			font = fnt_droid_serif_38_italic;
			continue;
		}
		
		// Switch to plain font
		if (_phrase == "</>") {
			font = fnt_droid_serif_38;
			continue;
		}
		
		// Advance image
		if (_phrase == "<img>") {
			obj_scene_image.next_image();
			array_delete(my_scene.story, p, 1);
			p--;
			continue;
		}
		
		// Play a sound
		if (string_starts_with(_phrase, "<snd ")) {
			var _sound = string_copy(_phrase, 6, string_length(_phrase) - 6); // Brackets indicate the portion of the string that will be copied "<snd {...}>"
			audio_oneshot(_sound);
			array_delete(my_scene.story, p, 1);
			p--;
		}
	
		// Draw last phrase(s) character-by-character
		draw_set(c_white, font);
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
	
		// DRAW PHRASE TEXT
		_char_count = _char_count_plus;
		draw_text(_x, _y, _phrase);
		if (_char_count >= _char_count_end) break;

		// Carriage return
		_x = l_margin;
	}
	story_bot_y = _y;
}