#macro LINE_W 1080
#macro LINE_W_H (LINE_W/2)

// NOTE: probably want to convert struct of structs into array of structs so we aren't using the name twice in the data file
#macro JSON_SCENES global.json_scenes
#macro SCENES global.scenes
JSON_SCENES = json_load("scenes_english_string.txt");
//SCENES = {}
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


//// Add scenes to array
//var _ambulance = scene_add(JSON_SCENES.ambulance);
//var _keening = scene_add(JSON_SCENES.keening);
//var _crater = scene_add(JSON_SCENES.crater);
//var _grove = scene_add(JSON_SCENES.grove);
//var _egg = scene_add(JSON_SCENES.egg);

//// Separate scenes into biomes
//#macro BIOMES global.scene_biomes
//BIOMES = {
//	plain:    [_ambulance],
//    city:     [_keening, _egg],
//    mountain: [],
//    swamp:    [],
//    forest:   [_grove],
//    river:    [_crater],
//}