#macro LINE_W 1920
#macro LINE_W_H (LINE_W/2)

#macro JSON_SCENES global.json_scenes
#macro SCENES global.scenes
JSON_SCENES = json_load("scenes_english.txt");
SCENES = {};
SCENES.ambulance = [];

draw_set();
for (var i = 0; i < array_length(JSON_SCENES.ambulance); i++) {
	var _paragraph = JSON_SCENES.ambulance[i];
	var _words = parse_words(_paragraph);
	var _lines = parse_lines(_words, 1920);
	SCENES.ambulance = array_concat(SCENES.ambulance, _lines);
	array_push(SCENES.ambulance, "");
}