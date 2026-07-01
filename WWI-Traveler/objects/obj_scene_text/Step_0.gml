states.execute(Event.step);
//// Await input or advance text by initiating fades
//if (awaiting_input) {
//	if (mouse_check_button_pressed(mb_left)) {
//		var _wait = scene_get_next_wait(SCENES.ambulance);
//		array_delete(SCENES.ambulance.story, _wait, 1);
//		awaiting_input = false;
//		next_wait_jump_to();
//	}
//} else { 
//	for (var i = char_spd-1; i >= 0; i--) {
//		var _off = i * (fade_spd / char_spd);
//		array_push(fade_values, _off);
//	}
//}

// Have we reached the end of the story?
var _story_length = story_get_char_count(SCENES.ambulance.story);
if (characters_opaque_count >= _story_length) {
	// TODO: go to question state?
}