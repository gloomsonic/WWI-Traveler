enum Event { enter, beginStep, step, draw, final }

function use_states(_owner = other.id) constructor {
	owner = _owner;
	state = noone;
	next = noone;
	previous = noone;
	timer = 0;
	isReset = false;
		
	list = {};
	vars = {};
		
	// Intend next state
	queue = function(_state) {
		next = _state;
	}
	
	// Run the appropriate event of the state
	execute = function(_event) {
		if (state == noone) return;
		var _state = list[$ state];
		with (owner) _state(_event);
	}
		
	// Swap states and increment timer
	update = function() {
		if (next == state) and (!isReset) {
			timer++;
			exit;
		}
		
		isReset = false;
		timer = 0;
		execute(Event.final);
		previous = state;
		state = next;
		execute(Event.enter);
	}
			
	// Assign the state script via enum
	define = function(_type, _script) {
		list[$ _type] = _script;
	}

	// Tell update to rerun enter event
	reset = function() {
		queue(state);
		isReset = true;
	}
}

enum State { 
	idle, hovered, held,
	select_combatant,
}
