function font_height(_font = draw_get_font()) {
	var _font_prev = draw_get_font();
	draw_set_font(_font);
	return string_height("Qy|");
	draw_set_font(_font_prev);
}