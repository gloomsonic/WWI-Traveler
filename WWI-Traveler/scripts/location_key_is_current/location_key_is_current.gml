// Return true if supplied key is on the global list of visited location keys
function map_location_visited(_key) {
	for (var i = 0; i < array_length(global.data.map_location_keys_visited); i++) {
		var _next_key = global.data.map_location_keys_visited[i];
		if (array_equals(_key, _next_key)) return true;
	}
	return false;
}

//function location_key_is_current(_key) {
//	return array_equals(_key, global.data.map_location_key);
//}