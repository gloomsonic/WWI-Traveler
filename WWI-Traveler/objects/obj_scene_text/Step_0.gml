// Scroll page
var _ud = mouse_wheel_down() - mouse_wheel_up();
y += scroll_spd * _ud;

// Await input or advance text by initiating fades
if (awaiting_input) {
	if (mouse_check_button_pressed(mb_left)) {
		var _wait = next_wait_phrase();
		array_delete(SCENES.ambulance, _wait, 1);
		awaiting_input = false;
		next_wait_jump_to();
	}
} else { 
	for (var i = char_spd-1; i >= 0; i--) {
		var _off = i * (fade_spd / char_spd);
		array_push(fade_values, _off);
	}
}

// Increment fades
for (var f = 0; f < array_length(fade_values); f++) {
	fade_values[f] += fade_spd;
	if (fade_values[f] < 1.0) 
		continue;
	
	// Finished a fade
	array_delete(fade_values, f, 1);
	characters_opaque_count++;
	f--;
}