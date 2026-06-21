// Return an array of width-bound strings based on the supplied words
function parse_lines(_words, _max_w) {
	var _lines = [""];
	var _line_index = 0;
	
	for (var w = 0; w < array_length(_words); w++) {
		var _word = _words[w];
		var _line = _lines[_line_index];
		var _line_plus_w = string_width(_line + _word);
		
		// New line
		if (_line_plus_w >= _max_w) {
			array_push(_lines, "");
			_line_index += 1;
		}	
		_lines[_line_index] += _word + " ";
	}
	return _lines;
}