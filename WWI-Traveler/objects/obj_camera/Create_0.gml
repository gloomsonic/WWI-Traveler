view_w = 3840;
view_h = 2160;
win_w = 1920;
win_h = 1080;
call_next_frame(function() {
	window_center()
});

on_room_start = function() {
	camera_set_view_size(VIEW, view_w, view_h);
	window_set_size(win_w, win_h);
	view_visible[0] = true;
	view_enabled = true;
}