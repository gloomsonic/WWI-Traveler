switch(room) {
	case rm_start:
		camera_set_view_pos(VIEW, 0, 0);
		break;
	case rm_combat:
		camera_set_view_pos(VIEW, 0, 0);
		break;
	case rm_scene:
		camera_set_view_pos(VIEW, obj_scene_text.x, obj_scene_text.y);
		break;
}
