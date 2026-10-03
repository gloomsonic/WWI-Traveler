image_alpha = approach(image_alpha, 1.0, fade_spd);
if (image_alpha >= 1.0)
	room_goto(rm_callback);