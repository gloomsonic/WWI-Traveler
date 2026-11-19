// Text is scrolling
function state_scene_reading(_event) {
	switch(_event) {
		case Event.enter:
			audio_play_tracked("typewriter", EV_TYPEWRITER);
			break;
		case Event.step: 
			scroll_page();
			increment_char_fades();
			
			// Add new fade values every frame, so increment_char_fades() can resolve and delete them
			for (var i = char_spd-1; i >= 0; i--) {
				var _off = i * (fade_spd / char_spd);
				array_push(fade_values, _off);
			}
			
			// Exit state
			if (check_story_ended()) {
				audio_oneshot(EV_TYPEWRITER_END);
				audio_stop_tracked("typewriter");
				if (array_length(my_scene.choices) > 0)
					states.queue(State.choosing);
				else
					next_encounter_check_start();
			}
			break;
		case Event.draw:
			draw_phrases();
			break;
		case Event.final:
			break;
	}
}

// Story is awaiting click to proceed
function state_scene_waiting(_event) {
	switch(_event) {
		case Event.enter:
			audio_stop_tracked("typewriter");
			break;
		case Event.step: 
			scroll_page();
			increment_char_fades();
		
			// Exit state
			if (mouse_check_button_pressed(mb_left)) {
				var _wait = scene_get_next_wait(my_scene);
				if (_wait != noone)
					array_delete(my_scene.story, _wait, 1);
				next_wait_jump_to();
				states.queue(State.reading);
				//check_choosing();
			}
			break;
		case Event.draw:
			draw_phrases();
			break;
		case Event.final:
			break;
	}
}

// Story choices are onscreen awaiting click to proceed
function state_scene_choosing(_event) {
	switch(_event) {
		case Event.enter:
			//audio_stop_tracked("typewriter");
			//audio_oneshot(EV_TYPEWRITER_END);
			var _story_len = story_character_count + array_length(fade_values);
			truncate_fades(characters_opaque_count, _story_len);
			spawn_choices();
			break;
		case Event.step: 
			scroll_page();
			break;
		case Event.draw:
			draw_phrases();
			break;
		case Event.final:
			break;
	}
}