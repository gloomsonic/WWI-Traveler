// constructs a verb which is pressed, held, and released like a button
function verb_button(_inputs) constructor {
	var _input;
	var _size = array_length(_inputs);
	if (!is_array(_inputs)) show_message("you initialized a button without an array!")
	
	gamepadButtons = [];
	keys = [];
	tilts = [];
	mouseButtons = [];
	amount = 0;
	held = false;
	pressed = false;
	released = false;
	
	heldPrevious = false; // For tilts
	amountsPrevious = array_create(4); // For tilts
	flicked = false; // For tilts
	flickedThreshold = 0.75; // For tilts
	
	lastPressed = 1000000;
	doublePressed = false;
	doublePressedBuffer = 30;
	type = undefined;
	
	// place the new button verb on the array associated with its button type
	for (var i = 0; i < _size; i++) {
		_input = _inputs[i];
		switch (_input.type) {

			case ButtonType.keyboard: 
				array_push(keys, _input);
				break;
				
			case ButtonType.gamepad:
				array_push(gamepadButtons, _input);
				break;
			
			case ButtonType.tilt:
				array_push(tilts, _input);
				break;
				
			case ButtonType.mouse:
				array_push(mouseButtons, _input);
				break;
		}
	}
	
	// methods to force button states
	verb_button_overrides();
	
	// refresh button states 
	update = function(_slot, _device) {
		held = false;
		pressed = false;
		released = false;
		flicked = false;
		lastPressed++;
		doublePressed = false;
		amount = 0;
		type = undefined;
		
		updateGamepadButtons(_slot, _device);
		updateTilts(_slot, _device);
		updateKeys(_device);
		updateMouseButtons(_device);
		heldPrevious = held; // only for tilts
	}
	
	// gamepad buttons
	updateGamepadButtons = function(_slot, _device) {
		if (_device == DeviceType.keyboard) return;
		
		for (var i = 0; i < array_length(gamepadButtons); i++) {
			amount = gamepad_button_check(_slot, gamepadButtons[i].button);
			if (gamepad_button_check(_slot, gamepadButtons[i].button)) held = true;
			if (gamepad_button_check_pressed(_slot, gamepadButtons[i].button)) {
				pressed = true;
				if (lastPressed < doublePressedBuffer) doublePressed = true;
				lastPressed = 0;
			}
			if (gamepad_button_check_released(_slot, gamepadButtons[i].button)) released = true;
		}
	}

	// analog stick tilts
	updateTilts = function(_slot, _device) {
		if (_device == DeviceType.keyboard) return;

		for (var i = 0; i < array_length(tilts); i++) {
			var _value = gamepad_axis_value(_slot, tilts[i].axis);
			var _sameSide = sign(_value) == tilts[i].side;
			
			// check pressed and held
			if (_sameSide) { 
				amount = abs(_value);
				if (amount > 0) held = true;
				if (amount > 0) and (!heldPrevious) {
					pressed = true;
					if (lastPressed < doublePressedBuffer) doublePressed = true;
					lastPressed = 0;
				}
				
				// check flicked
				if (amount >= flickedThreshold) and (amountsPrevious[0] < flickedThreshold) {
					for (var j = 0; j < array_length(amountsPrevious); j++) {
						var _amount = amountsPrevious[j];
						if (_amount != 0) continue;
						flicked = true;
						break;
					}
				}
				
			// check released
			} else {
				amount = 0;
				if (heldPrevious) released = true;
			}
			
			// store previous amounts for stick flicks
			array_insert(amountsPrevious, 0, amount);
			array_pop(amountsPrevious);
		}
	}
	
	// keyboard keys
	updateKeys = function(_device) {
		if (_device == DeviceType.gamepad) return;
		
		for (var i = 0; i < array_length(keys); i++) {
			amount = keyboard_check(keys[i].button);
			if (keyboard_check(keys[i].button)) held = true;
			if (keyboard_check_pressed(keys[i].button)) {
				pressed = true;
				if (lastPressed < doublePressedBuffer) doublePressed = true;
				lastPressed = 0;
			}
			if (keyboard_check_released(keys[i].button)) released = true;
		}
	}
	
	// mouse buttons
	updateMouseButtons = function(_device) {
		if (_device == DeviceType.gamepad) return;
		
		for (var i = 0; i < array_length(mouseButtons); i++) {
			amount = mouse_check_button(mouseButtons[i].button);
			if (mouse_check_button(mouseButtons[i].button)) held = true;
			if (mouse_check_button_pressed(mouseButtons[i].button)) {
				pressed = true;
				if (lastPressed < doublePressedBuffer) doublePressed = true;
				lastPressed = 0;
			}
			if (mouse_check_button_released(mouseButtons[i].button)) released = true;
		}
	}
}