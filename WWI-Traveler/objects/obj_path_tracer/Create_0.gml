precision = 0.05;
paths = asset_get_ids(asset_path);

// TODO: 
/* 
+ draw each path to a cleared surface
+ draw lines to create sprite from surface, really wide so they're easy to mouse over
+ set its bbox to precise
+ create an object with this sprite as its sprite_index and bbox
+ draw those objects instead of drawing lines every frame
*/
//var _sprite = sprite_create_from_surface()
//sprite_set_bbox_mode(_sprite, bboxkind_precise);