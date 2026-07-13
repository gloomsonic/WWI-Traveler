///@desc states

event_inherited();

state_idle = function(_event){
	switch(_event){
		case Event.draw:
			draw_set();
			draw_circle(x, y, MAP_NODE_DIAMETER/2, false);
			break;
	}
}

state_hovered = function(_event){
	switch(_event){
		case Event.draw:
			draw_set();
			draw_circle(x, y, MAP_NODE_DIAMETER/2, false);
			draw_set(c_yellow);
			draw_circle(x, y, sprite_width * 0.7, true);
			draw_set(c_white);
			break;
	}

}

state_held = function(_event){
	switch(_event){
		case Event.draw:
			draw_set();
			draw_circle(x, y, MAP_NODE_DIAMETER/2, false);
			draw_set(c_aqua);
			draw_circle(x, y, sprite_width * 0.7, true);
			draw_set(c_white);
			break;
	}
}

on_pressed  = function() {};
on_released = function() {};