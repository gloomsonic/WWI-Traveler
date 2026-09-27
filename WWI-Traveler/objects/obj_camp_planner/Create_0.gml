event_inherited();

obj_cursor_camp.add_touchable(id);

// Create the formation menu
formation_menu_create = function() {
	instance_create_depth(ROOM_W_H, ROOM_H_H, depth, obj_camp_formation_menu);
}

// Destroy the formation menu and its associated objects
formation_menu_destroy = function() {
	instance_destroy(obj_camp_formation_menu);
	instance_destroy(obj_camp_formation_space);
}