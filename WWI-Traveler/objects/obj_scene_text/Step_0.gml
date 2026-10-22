states.execute(Event.step);

// Skip to end of story
if (keyboard_check_pressed(vk_f2)) {
	characters_opaque_count = story_get_char_count(my_scene.story);
	for (var p = 0; p < array_length(my_scene.story); p++) {
		var _phrase = my_scene.story[p];
		if (_phrase == "<w>") {
			array_delete(my_scene.story, p, 1);
			p--;
		}
	}
	
	var _line_count = scene_get_line_count(my_scene); // NOTE: it's ok if '_next' is 'noone'
	var _text_bot = _line_count * font_height(font) * line_spacing;
	scroll_y(_text_bot - ROOM_H_H);
}