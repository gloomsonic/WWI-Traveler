///@desc states

event_inherited();

state_idle = function(_event){
	switch(_event){
		case Event.draw:
			draw_self();
			break;
	}
}

state_hovered = function(_event){
	switch(_event){
		case Event.draw:
			draw_self();
			draw_set_color(c_yellow);
			draw_circle(x, y, sprite_width * 0.7, true);
			draw_set_color(c_white);
			break;
	}

}

state_held = function(_event){
	switch(_event){
		case Event.draw:
			draw_self();
			draw_set_color(c_aqua);
			draw_circle(x, y, sprite_width * 0.7, true);
			draw_set_color(c_white);
			break;
	}
}

on_pressed  = function() {};
on_released = function() {};