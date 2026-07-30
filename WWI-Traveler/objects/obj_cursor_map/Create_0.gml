// Inherit the parent event
event_inherited();

states.define(State.map_select, state_cursor_map_select);
states.queue(State.map_select);

available_locations = [];
on_room_start = function() {

	// Push locations other than current one into an array
	with (obj_map_location) {
		if (map_location_visited(my_location_key)) continue;
		array_push(other.available_locations, id);
	}
}