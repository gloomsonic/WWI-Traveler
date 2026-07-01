// Returns the index of the next 'wait' phrase
function scene_get_next_wait(_scene) {
	var _story = _scene.story;
	
	for (var p = 0; p < array_length(_story); p++) {
		var _phrase = _story[p];
		if (_phrase != "<w>") continue;
		return p;
	}
	return noone;	
}

// Count the number of line breaks in a scene, optionally stopping at a 'cutoff' phrase
function scene_get_line_count(_scene, _cutoff = noone) {
	var _story = _scene.story;
	var _line_count = 0;

	for (var p = 0; p < array_length(_story); p++) {
		var _phrase = _story[p];
		if (_cutoff != noone) and (p >= _cutoff) 
			break;

		if (_phrase == "<n>") _line_count += 1;
		if (_phrase == "<p>") _line_count += 2;
	}
	return _line_count
}

//
function phrase_is_instruction(_phrase) {
	var _char = string_char_at(_phrase, 1);
	return _char == "<";
}

// 
function story_get_char_count(_story) {
	var _char_count = 0;
	
	for (var p = 0; p < array_length(_story); p++) {
		var _phrase = _story[p];
		if (phrase_is_instruction(_phrase)) continue;
		_char_count += string_length(_phrase);
	}
	return _char_count;
}