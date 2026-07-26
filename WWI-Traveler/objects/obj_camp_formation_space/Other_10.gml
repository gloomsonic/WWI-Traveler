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

		// Get combatants
		var _my_combatant = global.data.party[row][pos];
		var _other_combatant = global.data.party[_other_space.row][_other_space.pos];

		// Swap combatants
		array_insert(global.data.party[row], pos, _other_combatant); // Other combatant inserted in my combatant's index
		array_delete(global.data.party[row], pos+1, 1); // My combatant deleted
		array_insert(global.data.party[_other_space.row], _other_space.pos, _my_combatant); // My combatant inserted at other combatant's index
		array_delete(global.data.party[_other_space.row], _other_space.pos+1, 1); // Other combatant deleted

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
			break;
	}
}

state_hovered = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			break;
	}
}

state_held = function(_event) {
	switch(_event) {
		case Event.step: 
			break;
		case Event.draw: 
			break;
	}
}