// Inherit the parent event
event_inherited();

states.define(State.map_select, state_cursor_map_select);
states.queue(State.map_select);

my_location = noone;

//available_locations = [];
on_room_start = function() {
	var _last_key = array_last(global.data.map_location_keys_visited);
	
	// Get map location with last key
	with (obj_map_location) {
		if (my_location_key != _last_key) continue;
		other.my_location = id;
		break;
	}
	
	//// Push locations other than current one into an array
	//with (obj_map_location) {
	//	if (map_location_visited(my_location_key)) continue;
	//	array_push(other.available_locations, id);
	//}
}