draw_set_color(c_white);

for(var i = 0; i < array_length(path_line); i++){
	var _a = get_node(path_line[i].a);
	var _b = get_node(path_line[i].b);
	
	if (_a != noone && _b != noone)
	{
		draw_line_width(_a.x, _a.y, _b.x, _b.y, 3);
	}
}

if (link_first_node != noone && mouse_check_button(mb_left)){
	draw_line_width(link_first_node.x, link_first_node.y, mouse_x, mouse_y, 2);
}

if (selected_node != noone && instance_exists(selected_node))
{
	draw_set_color(c_white);
	draw_circle(selected_node.x, selected_node.y, selected_node.sprite_width * 0.9, true);
	draw_set_color(c_white);
}