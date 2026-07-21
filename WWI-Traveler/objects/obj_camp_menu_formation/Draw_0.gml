draw_set();
draw_self_ext();

var _size = array_length(global.data.party);
var _x = BBOX_L;
var _y = BBOX_T;
for (var i = 0; i < _size; i++) {
	var _combatant = global.data.party[i];
	var _name = _combatant.name;
	draw_text(_x, _y, _name);
	_y += font_height();
}