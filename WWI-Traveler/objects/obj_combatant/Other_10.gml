///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
}
on_released = function() {
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.step: 
			log($"{id}: idle");
			break;
		case Event.draw: 
			draw_self_ext(); 
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.step: 
			log($"{id}: hovered");
			break;
		case Event.draw: 
			draw_self_ext(,,,,,,, c_blue); 
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.step: 
			log($"{id}: held");
			break;
		case Event.draw: 
			draw_self_ext(,,,,,,, c_red); 
			break;
	}
}

//// Non-standard state
//state_flash = function(_event) {
//	switch(_event) {
//		case Event.enter:
//			listening = false;
//			break;
//		case Event.step: 
//			log($"{id}: flashing");
//			if (flash_remaining mod flash_duration == 0)
//				image_alpha = !image_alpha;
				
//			flash_remaining = approach(flash_remaining, -1, 1);
//			if (flash_remaining <= 0)
//				states.queue(State.idle);
//			break;
//		case Event.draw: 
//			draw_self_ext(); 
//			break;
//		case Event.final:
//			image_alpha = 1;
//			break;
//	}
//}