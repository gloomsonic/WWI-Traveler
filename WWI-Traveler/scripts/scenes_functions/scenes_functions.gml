// Returns the index of the next 'wait' phrase
function scene_get_next_wait(_scene) {
	for (var p = 0; p < array_length(_scene); p++) {
		var _phrase = _scene[p];
		if (_phrase != "<w>") continue;
		return p;
	}
	return noone;	
}

// Count the number of line breaks in a scene, optionally stopping at a 'cutoff' phrase
function scene_get_line_count(_scene, _cutoff = noone) {
	var _line_count = 0;
	for (var p = 0; p < array_length(_scene); p++) {
		var _phrase = _scene[p];
		if (_cutoff != noone) and (p >= _cutoff) 
			break;

		if (_phrase == "<n>") _line_count += 1;
		if (_phrase == "<p>") _line_count += 2;
	}
	return _line_count
}