function mouse_cursor_methods() {
	
	// Use the mouse to change object states
	touch_object = function(_obj) {
		var _data = {
			inst: noone,
			hovered: false,
			held: false,
			pressed: false,
			released: false,
		}
		//_data.inst = instance_position(mouse_x, mouse_y, _obj);
		_data.inst = instance_place(mouse_x, mouse_y, _obj);
	
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
	
	// Push a new object or instance to the 'touch_these' array
	add_touchable = function(_inst) {
		array_push(touch_these, _inst);
	}
	
	// Delete an object or instance from the 'touch_these' array
	delete_touchable = function(_inst) {
		var _index = array_get_index(touch_these, _inst);
		if (_index == -1) return;
		array_delete(touch_these, _index, 1);
	}
	
	// Reset touchable array to nothing
	clear_touchables = function() {
		touch_these = [];
	}
}