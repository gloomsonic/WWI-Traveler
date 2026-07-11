// Returns the index of the next 'wait' phrase
function scene_get_next_wait(_scene) {
	var _story = _scene.story;
	
	for (var p = 0; p < array_length(_story); p++) {
		var _phrase = _story[p];
		if (_phrase != "<w>") continue;
		return p;
	}
	return noone;	
}

// Count the number of line breaks in a scene, optionally stopping at a 'cutoff' phrase
function scene_get_line_count(_scene, _cutoff = noone) {
	var _story = _scene.story;
	var _line_count = 0;

	for (var p = 0; p < array_length(_story); p++) {
		var _phrase = _story[p];
		if (_cutoff != noone) and (p >= _cutoff) 
			break;

		if (_phrase == "<n>") _line_count += 1;
		if (_phrase == "<p>") _line_count += 2;
	}
	return _line_count
}

//
function phrase_is_instruction(_phrase) {
	var _char = string_char_at(_phrase, 1);
	return _char == "<";
}

// 
function story_get_char_count(_story) {
	var _char_count = 0;
	
	for (var p = 0; p < array_length(_story); p++) {
		var _phrase = _story[p];
		if (phrase_is_instruction(_phrase)) continue;
		_char_count += string_length(_phrase);
	}
	return _char_count;
}

// Normalize a map node feature to lowercase
function biome_feature_lowercased(_feature) {
        return string_replace_all(string_lower(_feature), " ", "_");
}

// Scene pool for a node's geographical feature (arrival biome). Returns [] if none defined.
function biome_feature(_feature_index) {
    if (_feature_index < 0) or (_feature_index >= array_length(MAP_NODE_FEATURES)) return [];
	
    var _key = biome_feature_lowercased(MAP_NODE_FEATURES[_feature_index]);
    return variable_struct_exists(BIOMES, _key) ? BIOMES[$ _key] : [];
}

function path_feature(_feature_index) {
        if (_feature_index < 0) or (_feature_index >= array_length(MAP_PATH_OBSTACLES)) return [];
		
        var _key = biome_feature_lowercased(MAP_PATH_OBSTACLES[_feature_index]);
        return variable_struct_exists(PATH_BIOMES, _key) ? PATH_BIOMES[$ _key] : [];
}

// Pick one scene from a biome pool (random). Returns noone if the pool is empty.
function scene_pick(_scene) {
    if (array_length(_scene) == 0) return noone;
    return _scene[irandom(array_length(_scene) - 1)];
}