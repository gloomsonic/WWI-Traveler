#macro LINE_W 1920
#macro LINE_W_H (LINE_W/2)

// NOTE: probably want to convert struct of structs into array of structs so we aren't using the name twice in the data file
#macro JSON_SCENES global.json_scenes
#macro SCENES global.scenes
JSON_SCENES = json_load("scenes_english_string.txt");
SCENES = {};

// Add scenes to array
var _ambulance = scene_add(JSON_SCENES.ambulance);
var _keening = scene_add(JSON_SCENES.keening);

// Separate scenes into biomes
#macro BIOMES global.scene_biomes
BIOMES = {
      plain:    [_ambulance],
      city:     [_keening],
      mountain: [],
      swamp:    [],
      forest:   [],
      river:    [],
}

#macro PATH_BIOMES global.path_biomes                                                       
 PATH_BIOMES = {                                                                             
      none:          [_ambulance],                         
      river:         [],                                                                    
      mountain_pass: [],                                                                    
      ravine:        [],                                                                    
      forest:        [],
}