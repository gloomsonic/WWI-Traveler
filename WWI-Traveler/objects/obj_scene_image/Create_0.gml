image_speed = 0;
image_next = image_index;
fade_pos = 1;
fade_spd = 0.1;
next_image = function() {
	image_next = floor(image_index + 1);
	fade_pos = 0;
}