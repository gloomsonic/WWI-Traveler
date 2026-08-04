available_locations = [location_2];

// Be first
if (array_length(global.data.map_location_keys_visited) <= 0)
	array_push(global.data.map_location_keys_visited, my_location_key);