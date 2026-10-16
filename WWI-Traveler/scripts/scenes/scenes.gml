#macro SCENE_FONT fnt_readerly_38
#macro SCENE_FONT_ITALIC fnt_readerly_38_italic

#macro LINE_W 1080
#macro LINE_W_H (LINE_W/2)

#macro JSON_SCENES global.json_scenes
#macro SCENES global.scenes
JSON_SCENES = json_load("scenes_english_string.txt");
SCENES = []

// Add scenes to array
scene_add(JSON_SCENES.ambulance);
scene_add(JSON_SCENES.keening);
scene_add(JSON_SCENES.crater);
scene_add(JSON_SCENES.egg);
scene_add(JSON_SCENES.grove);
scene_add(JSON_SCENES.horse);
scene_add(JSON_SCENES.piobare);
scene_add(JSON_SCENES.armor);
scene_add(JSON_SCENES.forest_trench);

// Scene constructor
function scene(_story, _choices, _name, _sprite) constructor {
	story = _story;
	choices = _choices;
	name = _name;
	sprite = _sprite;
}

// Parse a json_scene into a real scene on the global struct and return its value
function scene_add(_json_scene) {
	draw_set();
	var _story = parse_story(_json_scene.story);
	var _choices =_json_scene.choices;
	var _name = _json_scene.name;
	var _sprite = asset_get_index(_json_scene.sprite);
	array_push(SCENES, new scene(_story, _choices, _name, _sprite));
}

// Get the scene struct with the supplied name
function scene_get(_name) {
	for (var i = 0; i < array_length(SCENES); i++) {
		var _scene = SCENES[i];
		if (_scene.name != _name) continue;
		return _scene;
	}
}