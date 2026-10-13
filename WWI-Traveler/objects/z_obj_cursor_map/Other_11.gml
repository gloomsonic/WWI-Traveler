///@desc states
event_inherited();

state_cursor_camp = function(_event) {
	switch(_event) {
		case Event.step:
			touch_object(touch_these);
			break;
		case Event.draw:
			if (keyboard_check(vk_f5))
				draw_self_ext(mask_index, 0, mouse_x, mouse_y)
			break;
	}
}