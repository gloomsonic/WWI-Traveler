event_inherited();

// Big mask
image_xscale = 2;
image_yscale = 2;

// Am I the 'current' location?
my_location_key = [xstart,ystart];
on_room_start = function() {
	if (!location_key_is_current(my_location_key)) return;
	image_blend = c_red;
}