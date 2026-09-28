draw_self_ext(,, VIEW_X, VIEW_Y);
if (image_index != image_next)
	draw_self_ext(, image_next, VIEW_X, VIEW_Y,,,,, fade_pos);


draw_set(c_black,,,, 0.65);
var _x1 = VIEW_X + (VIEW_W*0.65);
var _y1 = VIEW_Y;
var _x2 = VIEW_X + (VIEW_W*0.95);
var _y2 = VIEW_Y + VIEW_H;
draw_rectangle(_x1, _y1, _x2, _y2, false);