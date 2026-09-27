camp_formation_methods();

image_xscale = 10;
image_yscale = 10;
var _xpad = sprite_get_width(spr_camp_formation_space);
var _ypad = sprite_get_height(spr_camp_formation_space);

active_space = noone;

// Create touchable buttons for combatant formation
for (var r = 0; r < 2; r++) {
	for (var c = 0; c < 3; c++) {
		var _combatant = combatant_get_at_position(r, c);
		var _x = BBOX_L + (c * _xpad);
		var _y = BBOX_T + (r * _ypad);
		instance_create_depth(_x, _y, depth-1, obj_camp_formation_space, {
			row: r,
			col: c,
			my_combatant: _combatant,
		});
	}
}