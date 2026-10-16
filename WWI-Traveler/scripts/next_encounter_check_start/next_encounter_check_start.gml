function next_encounter_check_start() {
	if (array_length(ENCOUNTER_QUEUE) <= 0)
		return false;
	
	// Get encounter
	var _encounter = array_shift(ENCOUNTER_QUEUE);
	var _is_scene = is_instanceof(_encounter, scene);
	
	// Start encounter
	if (_is_scene) {
		room_transition_start(rm_scene);
		NEXT_SCENE = _encounter;
	} else {
		room_transition_start(rm_combat);
	}
	return true;
}