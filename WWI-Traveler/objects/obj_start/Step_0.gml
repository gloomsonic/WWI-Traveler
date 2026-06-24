if (keyboard_check_pressed(vk_space))
	room_goto(rm_combat);
if (keyboard_check_pressed(vk_shift))
	room_goto(rm_scene);
if (keyboard_check_pressed(ord("M")))
	room_goto(rm_map);