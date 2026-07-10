function parse_story(_story) {
	var _words = parse_words(_story);
	var _phrases = parse_phrases(_words);
	return _phrases;
}

// Parse into words and special characters
function parse_words(_story) {
	var _words = [];
	var _word = "";
	for (var c = 1; c <= string_length(_story); c++) {
		var _char = string_char_at(_story, c);
		switch (_char) {
		
			// Space
			case " ":
				array_push(_words, _word);
				_word = "";
				break;
		
			// Special character
			case "<":
				if (_word != "")
					array_push(_words, _word);
			
				var _spec_end = string_pos_ext(">", _story, c);
				var _spec_dif = _spec_end - c;
				var _spec_char = string_copy(_story, c, _spec_dif+1);
				array_push(_words, _spec_char);
			
				// Next word
				c += _spec_dif;
				_word = "";
				break;
		
			// Regular character
			default:
				_word += _char;
				break;
		}
	}

	// Get the last word
	if (_word != "")
		array_push(_words, _word);
		
	return _words;
}

// Parse words and characters into lines and instructions, phrases
function parse_phrases(_words) {
	var _phrases = [];
	var _phrase = "";
	for (var w = 0; w < array_length(_words); w++) {
		var _word = _words[w];
	
		// Special character, end phrase
		if (string_char_at(_word, 1) == "<") {
			if (_phrase != "")
				array_push(_phrases, string_trim(_phrase));
			
			array_push(_phrases, _word);
			_phrase = "";
			continue;
		}
	
		// Too long, end phrase
		var _phrase_w_plus = string_width(_phrase) + string_width(_word);
		if (_phrase_w_plus >= LINE_W) {
			array_push(_phrases, string_trim(_phrase));
			array_push(_phrases, "<n>");
			_phrase = "";
		}
	
		// Append phrase
		_phrase += $" {_word}";
	}

	// Get the last phrase
	if (_phrase != "")
		array_push(_phrases, string_trim(_phrase));
		
	return _phrases;
}