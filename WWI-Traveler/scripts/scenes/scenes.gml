#macro LINE_W 1920
#macro LINE_W_H (LINE_W/2)

#macro JSON_SCENES global.json_scenes
#macro SCENES global.scenes
JSON_SCENES = json_load("scenes_english_string.txt");
SCENES = {};

draw_set();

// Parse into words and special characters
var _words = [];
var _word = "";
for (var c = 1; c <= string_length(JSON_SCENES.ambulance.story); c++) {
	var _char = string_char_at(JSON_SCENES.ambulance.story, c);
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
			
			var _spec_end = string_pos_ext(">", JSON_SCENES.ambulance.story, c);
			var _spec_dif = _spec_end - c;
			var _spec_char = string_copy(JSON_SCENES.ambulance.story, c, _spec_dif+1);
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


// Parse words and characters into lines and instructions
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

SCENES.ambulance = {};
SCENES.ambulance.story = _phrases;
SCENES.ambulance.choices = JSON_SCENES.ambulance.choices;


//JSON_SCENES = json_load("scenes_english.txt");
//SCENES = {};
//SCENES.ambulance = [];

//draw_set();
//for (var i = 0; i < array_length(JSON_SCENES.ambulance); i++) {
//	var _paragraph = JSON_SCENES.ambulance[i];
//	var _words = parse_words(_paragraph);
//	var _lines = parse_lines(_words, 1920);
//	SCENES.ambulance = array_concat(SCENES.ambulance, _lines);
//	array_push(SCENES.ambulance, "");
//}