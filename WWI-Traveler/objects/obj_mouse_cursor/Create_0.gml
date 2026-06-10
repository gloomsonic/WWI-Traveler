hovered = noone;

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
		unhover();
		return _data;
	}

	// New object, idle prior
	if (instance_exists(hovered)) and (_data.inst != hovered) {
		hovered.states.queue(State.idle);
	}
	hovered = _data.inst;

	// Held or Hovered?
	if (mouse_check_button(mb_left)) {
		_data.inst.states.queue(State.held);
		_data.held = true;
	} else {
		_data.inst.states.queue(State.hovered);
		_data.hovered = true;
	}
	
	// Pressed and Released callbacks
	if (mouse_check_button_pressed(mb_left)) {
		_data.inst.on_pressed();
		_data.pressed = true;
	}
	if (mouse_check_button_released(mb_left)) {
		_data.inst.on_released();
		_data.released = true;
	}
	return _data;
}

// Reset hovered instance
unhover = function() {
	if (!instance_exists(hovered)) exit;
	hovered.states.queue(State.idle);
	hovered = noone;
}