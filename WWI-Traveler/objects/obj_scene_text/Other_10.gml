///@desc methods Step

// What actually 'moves' the scroll along the y axis
scroll_y = function(_y) {
	y = _y;
	y = clamp(y, 0, 16000);
}

// Scroll up and down the story with mouse wheel input
scroll_page = function() {
	var _ud = mouse_wheel_down() - mouse_wheel_up();
	var _yto = y + (scroll_spd * _ud);
	scroll_y(_yto);
}

//
increment_char_fades = function() {
	for (var f = 0; f < array_length(fade_values); f++) {
		fade_values[f] += fade_spd;
		if (fade_values[f] < 1.0) 
			continue;
	
		// Finished a fade
		array_delete(fade_values, f, 1);
		characters_opaque_count++;
		f--;
	}
}

// 
char_get_fade = function(_count, _end) {
	if (_count < characters_opaque_count) return 1.0;
	var _dif = _end - _count;
	var _alpha = fade_values[array_length(fade_values) - _dif];
	return _alpha;
}

// Automatically jump to next 'wait'
next_wait_jump_to = function() {
	var _next = scene_get_next_wait(my_scene);
	
	draw_set();
	var _line_count = scene_get_line_count(my_scene, _next); // NOTE: it's ok if '_next' is 'noone'
	var _text_bot = _line_count * font_height() * line_spacing;
	scroll_y(_text_bot - ROOM_H_H);
}

//
truncate_fades = function(_count, _end) {
	if (_end < _count) return;
	var _dif = _end - _count;
	var _fades_count = array_length(fade_values);
	array_delete(fade_values, _fades_count - _dif, _dif);
}

// When we've reached the end of the story, queue choosing state
check_choosing = function() {
	if (characters_opaque_count < story_character_count) return;
	states.queue(State.choosing);
}

//
spawn_choices = function() {
	var _x = l_margin;
	var _y = story_bot_y + choice_break;
	
	for (var c = 0; c < array_length(my_scene.choices); c++) {
		instance_create_depth(_x, _y, depth, obj_story_choice, {
			my_text: my_scene.choices[c],
		});
		_y += font_height() * choice_spacing;
	}
}