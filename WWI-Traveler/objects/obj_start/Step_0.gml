if (keyboard_check_pressed(vk_space))
	next_encounter_check_start();
if (keyboard_check_pressed(ord("F"))) { // TODO: doesn't reset your party
	ENCOUNTER_QUEUE = [ENEMY_PARTIES.soldier_4];
	next_encounter_check_start();
}
if (keyboard_check_pressed(ord("S"))) {
	ENCOUNTER_QUEUE = [scene_get("grove")];
	next_encounter_check_start();
}
//if (keyboard_check_pressed(ord("C")))
//	room_goto(rm_camp);
//if (keyboard_check_pressed(ord("M")))
//	room_goto(rm_map);