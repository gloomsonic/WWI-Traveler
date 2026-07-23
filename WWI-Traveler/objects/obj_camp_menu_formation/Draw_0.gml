draw_set();
draw_self_ext();

var _size = array_length(global.data.party);
var _l = BBOX_L;
var _xpad = 512;
var _t = BBOX_T;
var _ypad = font_height();

for (var i = 0; i < _size; i++) {
	var _combatant = global.data.party[i];
	var _name = _combatant.name;
	var _x = _l + (_combatant.pos * _xpad);
	var _y = _t + (_combatant.row * _ypad);
	draw_text(_x, _y, _name);
}

