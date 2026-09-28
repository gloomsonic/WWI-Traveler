image_speed = 0;
image_next = image_index;
fade_pos = 1;
fade_spd = 0.1;
next_image = function() {
	//image_index = floor(image_index + 1);
	image_next = floor(image_index + 1);
	fade_pos = 0;
}

//update_sprite = function(_spr, _img) {
//	sprite_index = _spr;
//	image_index = _img;
//}