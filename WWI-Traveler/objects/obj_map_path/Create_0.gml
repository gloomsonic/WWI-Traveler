event_inherited();
self [$ "my_encounters"] ??= [];
self [$ "my_path"] ??= noone;

obj_cursor_map.add_touchable(id);

path_sample_precision = 0.05;
path_width = 3;