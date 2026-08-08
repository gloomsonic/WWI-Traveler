function scene(_story, _choices, _name) constructor {
	story = _story;
	choices = _choices;
	name = _name;
}

// Parse a json_scene into a real scene on the global struct and return its value
function scene_add(_json_scene) {
	draw_set();
	var _story = parse_story(_json_scene.story);
	var _choices =_json_scene.choices;
	var _name = _json_scene.name;
	array_push(SCENES, new scene(_story, _choices, _name));
	
	//struct_set(SCENES, _name, new scene(_story, _choices));
	//return SCENES[$ _name];
}