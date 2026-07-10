var _y = 20;

draw_set_colour(c_black);
draw_text_transformed(20, _y, "Map Editor", 0.5, 0.5, 0);
_y += font_height();
draw_text_transformed(20, _y, "Node ID: " + string(selected_node != noone ? selected_node.node_id : -1), 0.5, 0.5, 0);

_y += font_height();
draw_text_transformed(20, _y, "Feature: " + (selected_node != noone ? MAP_NODE_FEATURES[selected_node.feature] : "-"), 0.5, 0.5, 0);

_y += font_height();
draw_text_transformed(20, _y, "Path Feature: " + (selected_path != noone ? MAP_PATH_OBSTACLES[selected_path.obstacle]: "-"), 0.5, 0.5, 0);

_y += font_height();
draw_text_transformed(20, _y, "Mode: " + (edit_mode ? "Edit" : "Play") + "  [Tab]", 0.5, 0.5, 0);

_y += font_height();
draw_text_transformed(20, _y, "Slot: " + (map_slot == -1 ? "-" : string(map_slot)), 0.5, 0.5, 0);