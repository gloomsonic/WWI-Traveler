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
	case rm_map_editor:
		// Pan the editor camera with the arrow keys or WASD, clamped inside the room.
		var _pan_x = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));
		var _pan_y = (keyboard_check(vk_down)  || keyboard_check(ord("S"))) - (keyboard_check(vk_up)   || keyboard_check(ord("W")));

		var _move_x = clamp(VIEW_X + _pan_x * map_pan_speed, 0, max(0, room_width  - VIEW_W));
		var _move_y = clamp(VIEW_Y + _pan_y * map_pan_speed, 0, max(0, room_height - VIEW_H));

		camera_set_view_pos(VIEW, _move_x, _move_y);
		break;
}
