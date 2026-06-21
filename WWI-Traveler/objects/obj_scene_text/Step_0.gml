var _ud = mouse_wheel_down() - mouse_wheel_up();
y += scroll_spd * _ud;

// Progress or await input
if (characters_onscreen < break_counts[0])
	characters_onscreen += 1;
else if (mouse_check_button_pressed(mb_left))
	array_shift(break_counts);