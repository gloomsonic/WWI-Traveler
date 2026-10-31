///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	scene_text_add_phrases(my_choice.story_result);
	instance_destroy(obj_story_choice);
	obj_scene_text.states.queue(State.reading);
	//next_encounter_check_start();
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.step: 
			log("idle"); 
			break;
		case Event.draw: 
			draw_set(, SCENE_FONT,, fa_middle, image_alpha);
			draw_circle(x, y, 16, true);
			draw_text(x + list_margin, y, my_choice.str);
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			draw_set(, SCENE_FONT,, fa_middle, image_alpha);
			draw_circle(x, y, 16, false);
			draw_text(x + list_margin, y, my_choice.str);
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.step: 
			log("held"); 
			break;
		case Event.draw: 
			draw_set(, SCENE_FONT,, fa_middle, image_alpha);
			draw_circle(x, y, 16, false);
			draw_text(x + list_margin, y, my_choice.str);
			break;
	}
}