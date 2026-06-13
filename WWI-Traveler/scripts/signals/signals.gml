global.library = {} // A struct comprised of arrays whose keys are the names of signal types, as created in signal_add
enum Signal_Type {
	on_combatant_ready,
}

function signal_add(_listener) {
	var _list = global.library[$ _listener.type];
	if (_list == undefined) {
		_list = []; 
		global.library[$ _listener.type] = _list; // First time we're having an signal of this type; create an array to store its listeners
	}
	array_push(_list, _listener); // Add new listener to the array named (key'd) after this signal type
	return _listener;
}

function signal_remove(_listener) {
	var _list = global.library[$ _listener.type];
	for (var i = 0; i < array_length(_list); i++) {
		if (_list[i] != _listener) continue;
		array_delete(_list, i, 1) return;
	}
}

function signal_raise(_type, _data = undefined) {
	var _list = global.library[$ _type];
	for (var i = 0; i < array_length(_list); i++) {
		var _listener = _list[i];
		if (instance_exists(_listener.owner)) _listener.callback(_data);
		if (!instance_exists(_listener.owner)) or (_listener.isOnce) {
			array_delete(_list, i, 1); // Self cleaning
			i--;
		}
	}
}

function signal_listener(_owner, _type, _callback, _isOnce = false) constructor {
	owner = _owner;
	type = _type;
	callback = _callback;
	isOnce = _isOnce;
}