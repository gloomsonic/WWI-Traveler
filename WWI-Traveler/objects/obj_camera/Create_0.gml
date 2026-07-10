view_w = 3840;
view_h = 2160;
win_w = 1920;
win_h = 1080;
call_next_frame(function() {
	window_center()
});

scene_lerp_spd = 0.12;

map_pan_speed = 24; // rm_map editor: camera pan pixels per frame (arrow keys / WASD)

on_room_start = function() {
	camera_set_view_size(VIEW, view_w, view_h);
	window_set_size(win_w, win_h);
	surface_resize(application_surface, win_w, win_h);
	
	view_visible[0] = true;
	view_enabled = true;
}