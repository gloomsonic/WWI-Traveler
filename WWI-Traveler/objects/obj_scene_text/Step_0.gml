var _ud = mouse_wheel_down() - mouse_wheel_up();
y += scroll_spd * _ud;

characters_onscreen_count += char_spd;

//// Progress or await input
//var _break = break_counts[0];
//if (characters_onscreen_count < _break) {
//	characters_onscreen_count = approach(characters_onscreen_count, _break, char_spd);
	
//	// Add an approrpiately offset fade for each new character
//	for (var i = char_spd-1; i >= 0; i--) {
//		var _off_mult = i / char_spd;
//		array_push(fades, fade_spd*_off_mult);
//	}
//} else {
//	if (mouse_check_button_pressed(mb_left))
//		array_shift(break_counts);
//}

//// Increment and complete fades
//for (var f = 0; f < array_length(fades); f++) {
//	fades[f] += fade_spd;
//	if (fades[f] < 1.0) continue;
//	array_delete(fades, f, 1);
//}