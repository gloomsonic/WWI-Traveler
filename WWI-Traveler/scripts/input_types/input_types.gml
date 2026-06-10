// button input types
function Key(_key) constructor {
	button = _key;
	type = ButtonType.keyboard;
}

function GamepadButton(_button) constructor {
	button = _button;
	type = ButtonType.gamepad;
}

function AxisTilt(_axis, _side) constructor {
	axis = _axis;
	side = _side;
	type = ButtonType.tilt;
}

function MouseButton(_button) constructor {
	button = _button;
	type = ButtonType.mouse;
}


// axes input types -- four keys, gamepad buttons, or axis tilts in a trench coat
function Arrows(_right, _up, _left, _down) constructor {
	right = new verb_button([new Key(_right)]);
	up = new verb_button([new Key(_up)]);
	left = new verb_button([new Key(_left)]);
	down = new verb_button([new Key(_down)]);
	type = AxesType.arrows;
}

function DPad(_right, _up, _left, _down) constructor {
	right = new verb_button([new GamepadButton(_right)]);
	up = new verb_button([new GamepadButton(_up)]);
	left = new verb_button([new GamepadButton(_left)]);
	down = new verb_button([new GamepadButton(_down)]);
	type = AxesType.dpad;
}

function Stick(_axish, _axisv) constructor {
	right = new verb_button([new AxisTilt(_axish, 1)]);
	up = new verb_button([new AxisTilt(_axisv, -1)]);
	left = new verb_button([new AxisTilt(_axish, -1)]);
	down = new verb_button([new AxisTilt(_axisv, 1)]);
	type = AxesType.stick;
}