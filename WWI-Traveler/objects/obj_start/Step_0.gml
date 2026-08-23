if (keyboard_check_pressed(vk_space))
	room_goto(rm_map);
if (keyboard_check_pressed(ord("F")))
	room_goto(rm_combat);
if (keyboard_check_pressed(ord("G")))
	room_goto(rm_combat2);
if (keyboard_check_pressed(ord("S")))
	room_goto(rm_scene);
if (keyboard_check_pressed(ord("C")))
	room_goto(rm_camp);
if (keyboard_check_pressed(ord("M")))
	room_goto(rm_map_editor);

//if (keyboard_check_pressed(vk_space))
//	room_goto(rm_combat);
//if (keyboard_check_pressed(vk_shift))
//	room_goto(rm_scene);
//if (keyboard_check_pressed(vk_control))
//	room_goto(rm_camp);
//if (keyboard_check_pressed(vk_tab))
//	room_goto(rm_map);
//if (keyboard_check_pressed(ord("M")))
//	room_goto(rm_map_editor);