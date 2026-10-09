event_inherited();

obj_cursor_map.add_touchable(id);

image_blend = c_white;
if (position_meeting(mouse_x, mouse_y, id))
	image_blend = c_blue;