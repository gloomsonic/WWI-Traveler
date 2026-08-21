///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	array_push(global.data.map_location_keys_visited, my_location_key);
	if (array_length(SCENES) > 0)
		room_goto(rm_scene);
	else
		room_goto(rm_win);
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			draw_self_ext(,,,, 0.5, 0.5); 
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			draw_self_ext(,,,, 0.9, 0.9); 
			gpu_set_blendmode(bm_subtract);
			draw_self_ext(,,,, 0.82, 0.82); 
			gpu_set_blendmode(bm_normal);
			draw_self_ext(,,,, 0.55, 0.55);
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			draw_self_ext(,,,, 0.4, 0.4);
			break;
	}
}