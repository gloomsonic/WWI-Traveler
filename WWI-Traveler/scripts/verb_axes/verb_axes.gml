// constructs a verb which refers to a horizontal and vertical axis
function verb_axes(_inputs) constructor {
	var _input;
	dpads = [];
	arrows = [];
	sticks = [];
	hori = 0;
	vert = 0;
	right = new verb_button([]);
	up = new verb_button([]);
	left = new verb_button([]);
	down = new verb_button([]);
	any = false;
	direction = -1;
	magnitude = 0;
	
	// place the new axes verb on the array associated with its axes type
	for (var i = 0; i < array_length(_inputs); i++) {
		_input = _inputs[i];
		switch (_input.type) {
			
			case AxesType.dpad: 
				array_push(dpads, _input); 
				break;
				
			case AxesType.stick:
				array_push(sticks, _input);
				break;
				
			case AxesType.arrows:
				array_push(arrows, _input);
				break;
		}
	}
	
	// methods to force axes values and trench coat button states
	verb_axes_overrides();
	
	// refresh horizontal and vertical axis values -- TODO: should we cease updating if we find a valid input on any device?
	update = function(_slot, _device) {
		hori = 0;
		vert = 0;
		right = new verb_button([]);
		up = new verb_button([]);
		left = new verb_button([]);
		down = new verb_button([]);
		any = false;
		
		updateDPads(_slot, _device);
		updateSticks(_slot, _device);
		updateArrows(_device);
		
		direction = -1;
		magnitude = 0;
		if (hori != 0) or (vert != 0) {
			direction = point_direction(0, 0, hori, vert);
			magnitude = min(1, point_distance(0, 0, hori, vert));
		}
	}
	
	// dpads -- 4 gamepad buttons in a trenchcoat	
	updateDPads = function(_slot, _device) {
		if (_device == DeviceType.keyboard) return;
		
		for (var i = 0; i < array_length(dpads); i++) {
			var _dpad = dpads[i];
			
			// get both axis orientations
			_dpad.right.update(_slot);
			_dpad.left.update(_slot);
			var _dpadHori = _dpad.right.held - _dpad.left.held;
			_dpad.down.update(_slot);
			_dpad.up.update(_slot);
			var _dpadVert = _dpad.down.held - _dpad.up.held;
			
			// confirm or deny
			if (_dpadHori == 0) and (_dpadVert == 0) continue;
			hori = _dpadHori;
			right = _dpad.right;
			left = _dpad.left;
			vert = _dpadVert;
			down = _dpad.down;
			up = _dpad.up;
			any = true;
			break;
		}
	}
	
	// analog sticks -- 4 stick tilts in a trench coat
	updateSticks = function(_slot, _device) {
		if (_device == DeviceType.keyboard) return;
		
		for (var i = 0; i < array_length(sticks); i++) {
			var _stick = sticks[i];
			
			// check both axes
			_stick.right.update(_slot);
			_stick.left.update(_slot);
			var _stickHori = _stick.right.amount - _stick.left.amount;
			_stick.down.update(_slot);
			_stick.up.update(_slot);
			var _stickVert = _stick.down.amount - _stick.up.amount;
			
			// confirm or deny
			if (_stickHori == 0) and (_stickVert == 0) continue;
			hori = _stickHori;
			right = _stick.right;
			left = _stick.left;
			vert = _stickVert;
			down = _stick.down;
			up = _stick.up;
			any = true;
			break;
		}
	}
	
	// arrow keys -- 4 keys in a trenchcoat
	updateArrows = function(_device) {
		if (_device == DeviceType.gamepad) return;
		
		for (var i = 0; i < array_length(arrows); i++) {
			var _arrows = arrows[i];
			
			// check both axes
			_arrows.right.update();
			_arrows.left.update();
			var _arrowsHori = _arrows.right.held - _arrows.left.held;
			_arrows.down.update();
			_arrows.up.update();
			var _arrowsVert = _arrows.down.held - _arrows.up.held;
			
			// confirm or deny
			if (_arrowsHori == 0) and (_arrowsVert == 0) continue;
			hori = _arrowsHori;
			right = _arrows.right;
			left = _arrows.left;
			vert = _arrowsVert;
			down = _arrows.down;
			up = _arrows.up;
			any = true;
			break;
		}
	}
}