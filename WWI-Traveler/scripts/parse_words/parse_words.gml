// Return an array of space-bound strings found in the text
function parse_words(_str) {
	var _words = [""]
	var _word_index = 0;
	
	for (var c = 1; c <= string_length(_str); c++) {
		var _char = string_char_at(_str, c);
		
		// New word
		if (_char == " ") {
			array_push(_words, "");
			_word_index += 1;
			continue; // Don't add the spaces
		}
		_words[_word_index] += _char;
	}
	return _words;
}