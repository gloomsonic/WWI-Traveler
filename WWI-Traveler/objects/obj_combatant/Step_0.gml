event_inherited();

//// Flash image alpha back and forth
//if (flash_remaining mod flash_duration == 0)
//	image_alpha = !image_alpha;
//flash_remaining = approach(flash_remaining, -1, 1);

//// Back to normal -- TODO: separate into states
//if (flash_remaining <= 0)
//	image_alpha = 1;