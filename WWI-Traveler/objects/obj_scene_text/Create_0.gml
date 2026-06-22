draw_set();

line_spacing = 1.4;
scroll_spd = font_height() * line_spacing;
char_spd = 2;
characters_faded = [];
characters_fading = [];
characters_onscreen_count = 0;
break_counts = [];

fade_spd = 0.03;
fades = [];

var _char_count = 0;
for (var l = 0; l < array_length(SCENES.ambulance); l++) {
	var _line = SCENES.ambulance[l];
	_char_count += string_length(_line);
	if (_line != "") continue;
	
	// Push paragraph breaks
	array_push(break_counts, _char_count);
}