#macro STICK_DEADZONE 0.20
enum DeviceType {keyboard, gamepad, both}
enum InputType {button, axes}
enum ButtonType {gamepad, keyboard, tilt, mouse}
enum AxesType {dpad, arrows, stick}

function use_controls(_deviceType, _gamepadSlot = 0) constructor { // TODO: make it possible to accept input from more than one gamepad
	gamepad_set_axis_deadzone(_gamepadSlot, STICK_DEADZONE);
	gamepadSlot = _gamepadSlot;
	deviceType = _deviceType;
	buttonVerbs = [];
	axesVerbs = [];
	
	// creates a verb with the supplied name usable via the supplied inputs
	define = function(_name, _inputType, _inputs) {
		switch (_inputType) {

			case InputType.button: 
				self[$ _name] = new verb_button(_inputs);
				array_push(buttonVerbs, self[$ _name]);
				break;
				
			case InputType.axes:
				self[$ _name] = new verb_axes(_inputs);
				array_push(axesVerbs, self[$ _name]);
				break;
		}
	}
	
	// refreshes verb values
	update = function() {
		updateButtonVerbs(gamepadSlot, deviceType);
		updateAxesVerbs(gamepadSlot, deviceType);
	}
	
	// held, pressed, and released values
	updateButtonVerbs = function(_slot, _device) {
		for (var i = 0; i < array_length(buttonVerbs); i++) {
			buttonVerbs[i].update(_slot, _device);
		}
	}
	
	// 4 buttons in a trenchcoat, with derived axis values
	updateAxesVerbs = function(_slot, _device) {
		for (var i = 0; i < array_length(axesVerbs); i++) {
			axesVerbs[i].update(_slot, _device);
		}
	}
	
	// default all axes values and button states -- mostly for CPUs
	reset = function() {
		for (var i = 0; i < array_length(buttonVerbs); i++)
			buttonVerbs[i].reset();
		for (var i = 0; i < array_length(axesVerbs); i++)
			axesVerbs[i].reset();
	}
}