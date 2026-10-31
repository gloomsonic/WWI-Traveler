function scene_text_add_phrases(_phrases) {
	with (obj_scene_text)
		{
		my_scene.story = array_concat(my_scene.story, _phrases);
		story_character_count = story_get_char_count(my_scene.story);
		}
}