draw_set_colour(c_white);

for (var i = 0; i < array_length(edges); i++){
	var _a = find_node_by_id(edges[i].a);
	var _b = find_node_by_id(edges[i].b);
	if (_a != noone && _b != noone)
	{
		draw_line_width(_a.x, _a.y, _b.x, _b.y, 30);	
	}
}

if (link_first_node != noone && mouse_check_button(mb_left)){
	draw_line_width(link_first_node.x, link_first_node.y, mouse_x, mouse_y, 20);
}