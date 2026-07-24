image_xscale = 10;
image_yscale = 10;
var _xpad = sprite_get_width(spr_camp_formation_space);
var _ypad = sprite_get_height(spr_camp_formation_space);

// Spawn combatants as touchable objects
for (var r = 0; r < array_length(global.data.party); r++) {
	var _row = global.data.party[r];
	
	for (var p = 0; p < array_length(_row); p++) {
		var _data = _row[p];
		var _name = noone;
		if (_data != noone)
			_name = _data.name;
		
		var _x = BBOX_L + (p * _xpad);
		var _y = BBOX_T + (r * _ypad);
		instance_create_depth(_x, _y, depth-1, obj_camp_formation_space, {
			row: r,
			pos: p,
			name: _name,
		});
	}
}