///@desc states
event_inherited();

// One-frame callbacks
on_pressed = function() {
	log("pressed");
}
on_released = function() {
	var _selected = obj_cursor_camp.get_formation_space();
	if (_selected == noone) {
		obj_cursor_camp.set_formation_space(id);
	} else if (_selected == id) {
		obj_cursor_camp.set_formation_space(noone); // Selected same one twice, do nothing
	} else {
		var _other_space = _selected;
		swap_combatant_datas(row, pos, _other_space.row, _other_space.pos);

		// Deselect and refresh
		obj_cursor_camp.set_formation_space(noone);	
		obj_camp_planner.formation_menu_destroy();
		obj_camp_planner.formation_menu_create();
	}
}

// State functions
state_idle = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw:  
			image_blend = c_white;
			if (obj_cursor_camp.get_formation_space() == id)
				image_blend = c_red;

			draw_self_ext();
			draw_text_solid_color(x, y, name, image_blend);
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			var _selected = obj_cursor_camp.get_formation_space()
			if (_selected == id)
				image_blend = c_red;
			else if (_selected != noone)
				image_blend = c_blue;
			else 
				image_blend = c_white;

			draw_self_ext();
			draw_text_solid_color(x, y, name, image_blend);
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			image_blend = c_gray;
			if (obj_cursor_camp.get_formation_space() == id)
				image_blend = c_red;

			draw_self_ext();
			draw_text_solid_color(x, y, name, image_blend);
			break;
	}
}