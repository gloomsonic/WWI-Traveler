if (mouse_check_button_pressed(mb_right)) {
	camp_state_set(Camp_State.top);
	instance_destroy(obj_camp_formation_space);
	instance_destroy();
}