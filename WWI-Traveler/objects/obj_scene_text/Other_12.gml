///@desc states
state_scene_reading = function(_event) {
	switch(_event) {
		case Event.enter:
			break;
		case Event.step: 
			scroll_page();
			increment_char_fades();
			
			for (var i = char_spd-1; i >= 0; i--) {
				var _off = i * (fade_spd / char_spd);
				array_push(fade_values, _off);
			}
			
			// Exit state
			check_choosing();
			break;
		case Event.draw:
			draw_phrases();
			break;
		case Event.final:
			break;
	}
}

state_scene_waiting = function(_event) {
	switch(_event) {
		case Event.enter:
			break;
		case Event.step: 
			scroll_page();
			increment_char_fades();
		
			// Exit state
			if (mouse_check_button_pressed(mb_left)) {
				var _wait = scene_get_next_wait(SCENES.ambulance);
				array_delete(SCENES.ambulance.story, _wait, 1);
				next_wait_jump_to();
				states.queue(State.reading);
			}
			break;
		case Event.draw:
			draw_phrases();
			break;
		case Event.final:
			break;
	}
}

state_scene_choosing = function(_event) {
	switch(_event) {
		case Event.enter:
			scroll_y(y + choice_break);
			var _story_len = story_character_count + array_length(fade_values); //story_get_char_count(SCENES.ambulance.story);
			truncate_fades(characters_opaque_count, _story_len);
			spawn_choices();
			break;
		case Event.step: 
			scroll_page();
			break;
		case Event.draw:
			draw_phrases();
			//draw_choices(story_bot_y);
			break;
		case Event.final:
			break;
	}
}