// Loops the array, returning the first index with a struct containing the supplied value at the supplied variable name (as string) or '-1'
function array_find_struct_with(_array, _var_name, _value) {
	var _size = array_length(_array);
	
	// Return the index of the first relevant struct
	for (var i = 0; i < _size; i++) {
		var _struct = _array[i];
		if (_struct[$ _var_name] == _value) {
			return i;
		}
	}
	
	// No index with a struct as described
	return -1;
}