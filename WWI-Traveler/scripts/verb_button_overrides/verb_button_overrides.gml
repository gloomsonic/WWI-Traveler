// methods to force a button into various state -- for CPUs
function verb_button_overrides() {
	pressedPrevious = false;
	heldPrevious = false;
	
	reset =  function() {
		pressedPrevious = pressed;
		heldPrevious = held;
		pressed = false;
		held = false
		released = false
		amount = 0;
		doublePressed = false;
	}
	
	setPressed = function(_amount = 1) {
		pressed = true;
		held = true;
		released = false;
		amount = _amount;
		doublePressed = false;
	}
	
	setHeld = function(_amount = 1) {
		pressed = false;
		held = true;
		released = false;
		amount = _amount;
		doublePressed = false;
	}
	
	setReleased = function() {
		pressed = false;
		held = false;
		released = true;
		amount = 0;
		doublePressed = false;
	}
	
	setDoublePressed = function(_amount = 1) {
		setPressed(_amount);
		doublePressed = true;
	}
	
	setFlicked = function() {
		setPressed(1);
		flicked = true;
	}
}