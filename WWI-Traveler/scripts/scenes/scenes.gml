#macro SCENE_FONT fnt_readerly_38
#macro SCENE_FONT_ITALIC fnt_readerly_38_italic

#macro LINE_W 1080
#macro LINE_W_H (LINE_W/2)

#macro JSON_SCENES global.json_scenes
#macro SCENES global.scenes
JSON_SCENES = json_load("scenes_english_string.txt");
SCENES = []

//// Add scenes to array
//scene_add(JSON_SCENES.ambulance);
//scene_add(JSON_SCENES.keening);
//scene_add(JSON_SCENES.crater);
//scene_add(JSON_SCENES.egg);
//scene_add(JSON_SCENES.grove);
//scene_add(JSON_SCENES.horse);
//scene_add(JSON_SCENES.piobare);
//scene_add(JSON_SCENES.armor);
//scene_add(JSON_SCENES.forest_trench);
//scene_add(JSON_SCENES.test_sundries_for_rations_or_gear);


//
scene_add(
	JSON_SCENES.ambulance,
	"ambulance",
	spr_scene_blank,
	[choice_callback_ambulance_0, choice_callback_ambulance_1],
);
scene_add(
	JSON_SCENES.test_sundries_for_rations_or_gear,
	"test sundries for rations or gear",
	spr_scene_blank,
	[choice_callback_sundries_0, choice_callback_sundries_1],
);

// Scene constructor
function scene(_story, _choices, _name, _sprite) constructor {
	story = _story;
	choices = _choices;
	name = _name;
	sprite = _sprite;
}

// Scene story choice constructor
function scene_choice(_str, _story_result, _callback) constructor {
	str = _str;
	story_result = _story_result;
	callback = _callback;
}

// Parse a json_scene into a real scene on the global struct and push it to global array
function scene_add(_json_scene, _name, _sprite, _callbacks) {
	draw_set();
	var _story = parse_story(_json_scene.story);
	//var _name = _json_scene.name;
	//var _sprite = asset_get_index(_json_scene.sprite);
	var _json_choices = _json_scene.choices;

	// Parse choice struct stories into pharses
	var _choices = [];
	for (var c = 0; c < array_length(_json_choices); c++) {
		var _str = _json_choices[c].str;
		var _story_result = parse_story(_json_choices[c].story_result);
		var _callback = _callbacks[c];
		var _choice_data = new scene_choice(_str, _story_result, _callback);
		array_push(_choices, _choice_data);
	}
	array_push(SCENES, new scene(_story, _choices, _name, _sprite)); //, _callbacks));
}

// Get the scene struct with the supplied name
function scene_get(_name) {
	for (var i = 0; i < array_length(SCENES); i++) {
		var _scene = SCENES[i];
		if (_scene.name != _name) continue;
		return _scene;
	}
}