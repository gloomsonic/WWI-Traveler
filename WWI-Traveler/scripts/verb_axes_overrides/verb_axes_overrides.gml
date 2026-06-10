//
function verb_axes_overrides() {
	reset = function() {
		direction = -1;
		hori = 0;
		vert = 0;
		right.reset();
		up.reset();
		left.reset();
		down.reset();
	}
	
	setDirection = function(_direction, _magnitude = 1) {
		direction = _direction;
		
		// directional released
		if (_direction == -1) {
			magnitude = 0;
			hori = 0;
			vert = 0;
			any = false;
			
			// release buttons
			if (right.pressedPrevious) 
				right.setReleased();
			if (up.pressedPrevious) 
				up.setReleased();
			if (left.pressedPrevious) 
				left.setReleased();
			if (down.pressedPrevious) 
				down.setReleased();
			return;
		}
				
		// directional held		
		magnitude = _magnitude;
		hori = lengthdir_x(_magnitude, direction);
		vert = lengthdir_y(_magnitude, direction);
		any = true;
		
		// press and hold buttons
		if (hori > 0) {
			if (right.pressedPrevious) right.setHeld();
			else right.setPressed();
		}
		if (vert < 0) {
			if (up.pressedPrevious) up.setHeld();
			else up.setPressed();
		}
		if (hori < 0) {
			if (left.pressedPrevious) left.setHeld();
			else left.setPressed();
		}
		if (vert > 0) {
			if (down.pressedPrevious) down.setHeld();
			else down.setPressed();
		}
	}
}