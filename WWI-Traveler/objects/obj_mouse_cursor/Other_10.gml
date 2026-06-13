///@desc methods Touch
set_touchable = function(_obj) {
	touch_these = _obj;
}

// Use the mouse to change object states
touch_object = function(_obj) {
	var _data = {
		inst: noone,
		hovered: false,
		held: false,
		pressed: false,
		released: false,
	}
	_data.inst = instance_position(mouse_x, mouse_y, _obj);
	
	// No object, idle prior
	if (_data.inst == noone) {
		if (instance_exists(hovered)) {
			hovered.try_cursor_queue(State.idle);
			hovered = noone;
		}
		return _data;
	}

	// New object, idle prior
	if (instance_exists(hovered)) and (_data.inst != hovered) {
		hovered.try_cursor_queue(State.idle);
	}
	hovered = _data.inst;

	// Held or Hovered?
	if (mouse_check_button(mb_left)) {
		if (hovered.try_cursor_queue(State.held))
			_data.held = true;
	} else {
		if (hovered.try_cursor_queue(State.hovered))
			_data.hovered = true;
	}
	
	// Pressed and Released callbacks
	if (mouse_check_button_pressed(mb_left)) {
		if (hovered.try_cursor_pressed())
			_data.pressed = true;
	} else if (mouse_check_button_released(mb_left)) {
		if (hovered.try_cursor_released())
			_data.released = true;
	}
	return _data;
}