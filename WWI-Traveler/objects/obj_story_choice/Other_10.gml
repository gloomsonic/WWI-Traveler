///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	room_goto(rm_combat);
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.step: 
			log("idle"); 
			break;
		case Event.draw: 
			draw_set(,,, fa_middle, image_alpha);
			draw_circle(x, y, 16, true);
			draw_text(x + list_margin, y, my_text);
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			draw_set(,,, fa_middle, image_alpha);
			draw_circle(x, y, 16, false);
			draw_text(x + list_margin, y, my_text);
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.step: 
			log("held"); 
			break;
		case Event.draw: 
			draw_set(,,, fa_middle, image_alpha);
			draw_circle(x, y, 16, false);
			draw_text(x + list_margin, y, my_text);
			break;
	}
}