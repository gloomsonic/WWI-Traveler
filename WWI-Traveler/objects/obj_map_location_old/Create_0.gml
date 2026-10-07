event_inherited();

self [$ "available_locations"] = noone; // obj_map_locations to which the player can traverse from this one

// Big mask
image_xscale = 2;
image_yscale = 2;

// Is my key on the visited list?
my_location_key = string(xstart) + string(ystart);
on_room_start = function() {
	if (!map_location_visited(my_location_key)) return;
	image_blend = c_red;
}