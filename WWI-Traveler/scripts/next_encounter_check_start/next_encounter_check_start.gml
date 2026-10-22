function next_encounter_check_start() {
	
	// Path done, reset and camp
	if (array_length(ENCOUNTER_QUEUE) <= 0) {
		LOCATION_CURRENT = LOCATION_NEXT;
		LOCATION_NEXT = noone;
		MAP_PATH_SELECTED = noone;

		room_goto(rm_camp);
		return false;
	}
	
	// Get encounter
	var _encounter = array_shift(ENCOUNTER_QUEUE);
	var _is_scene = is_instanceof(_encounter, scene);
	
	// Start encounter
	if (_is_scene) {
		room_transition_start(rm_scene);
		SCENE_NEXT = _encounter;
	} else {
		room_transition_start(rm_combat);
		ENEMY_PARTY = _encounter;
	}
	return true;
}