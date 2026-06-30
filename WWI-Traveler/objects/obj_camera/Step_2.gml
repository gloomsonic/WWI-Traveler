switch(room) {
	case rm_start:
		camera_set_view_pos(VIEW, 0, 0);
		break;
	case rm_combat:
		camera_set_view_pos(VIEW, 0, 0);
		break;
	case rm_scene:
		var _ygoal = obj_scene_text.y;
		var _ydif = _ygoal - VIEW_Y;
		
		if (abs(_ydif) >= 0.5)
			var _y = lerp(VIEW_Y, _ygoal, scene_lerp_spd);
		else var _y = _ygoal;
		
		camera_set_view_pos(VIEW, obj_scene_text.x, _y);
		break;
	case rm_map:
		camera_set_view_pos(VIEW, 0, 0);
		break;
}
