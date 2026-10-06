fade_pos = approach(fade_pos, 1, fade_spd);
if (image_index != image_next) and (fade_pos >= 1)
	image_index = image_next;