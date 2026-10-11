function scene_text_methods_draw() {
	
	// Draw the story text
	draw_phrases = function() {
		draw_set(c_white, font);
		var _x = l_margin;
		var _y = 0;
		var _char_count = 0;
		var _char_count_end = characters_opaque_count + array_length(fade_values);

		// One phrase at a time
		for (var p = 0; p < array_length(my_scene.story); p++) {
			var _phrase = my_scene.story[p];
			var _phrase_len = string_length(_phrase);
			var _char_count_plus = _char_count + _phrase_len;
			if (_char_count >= _char_count_end) 
				break; // Don't go past chars we've added
			
			// Handle special phrases, instructions
			if (string_starts_with(_phrase, "<")) {
				switch (_phrase) {
					case "<p>":
						_y += font_height(font) * line_spacing * 2;
						break;
					case "<w>":
						truncate_fades(_char_count, _char_count_end);
						_char_count_end = characters_opaque_count + array_length(fade_values); // Remeasure end character after deleting excess fades
						states.queue(State.waiting);					
						break;
					case "<n>":
						_y += font_height(font) * line_spacing;
						break;
					case "<i>":
						font = SCENE_FONT_ITALIC;
						break;
					case "</>":
						font = SCENE_FONT;
						break;
					case "<img>":
						obj_scene_image.next_image();
						array_delete(my_scene.story, p, 1);
						p--;	
						break;
				}
				
				// Start playing a sound
				if (string_starts_with(_phrase, "<snd ")) {
					var _split = string_split(_phrase, " ");
					var _name = _split[1];
					_name = string_delete(_name, string_last_pos(">", _name), 1);
					var _event = audio_event_get(_name);

					sounds[$ _name] = audio_oneshot(_event); // NOTE: a second instance of the same sound will have the same name and thus overwrite the reference to the first
					array_delete(my_scene.story, p, 1);
					p--;
				}
		
				// Adjust volume of a sound
				if (string_starts_with(_phrase, "<vol ")) {
					var _split = string_split(_phrase, " ");
					var _name = _split[3];
					_name = string_delete(_name, string_last_pos(">", _name), 1);
					
					var _sound = sounds[$ _name]; 
					var _volume_current = fmod_studio_event_instance_get_volume(_sound).final_volume;
					var _volume_target = real(_split[1]);
					var _fade_duration = real(_split[2]);
					instance_create_depth(0, 0, 0, obj_audio_transition, {
						volume_start: _volume_current,
						volume_target: _volume_target,
						fade_duration: _fade_duration,
						my_sound: _sound,
					})
					array_delete(my_scene.story, p, 1);
					p--; 
				}
				continue;
			}
			
			// *--* Draw the phrase *--* //
			draw_set(c_white, font);
			
			// Draw entire phrase at once
			if (_char_count_plus < characters_opaque_count) {
				var _t = VIEW_Y - font_height(font);
				var _b = VIEW_Y + VIEW_H;
				if (_y >= _t) and (_y <= _b)
					draw_text(_x, _y, _phrase);
					
				_char_count = _char_count_plus;	
				if (_char_count >= _char_count_end) break;
				_x = l_margin;
				continue;
			}
			
			// Draw each character of fading phrase, one-by-one
			for (var c = 1; c <= _phrase_len; c++) {
				var _char = string_char_at(_phrase, c);
				draw_set_alpha(char_get_fade(_char_count, _char_count_end));
				draw_text(_x, _y, _char);
				_x += string_width(_char);
				_char_count++;
					
				// Don't pass the end
				if (_char_count >= _char_count_end) break;
			}
			
			// Carriage return
			if (_char_count >= _char_count_end) break;
			_x = l_margin;
		}
		story_bot_y = _y;
	}
	
	
	// Returns intended alpha value, determined by distance from end of 'fade_values' array
	char_get_fade = function(_count, _end) {
		if (_count < characters_opaque_count) 
			return 1.0;
		
		var _dif = _end - _count;
		var _alpha = fade_values[array_length(fade_values) - _dif];
		return _alpha;
	}
}