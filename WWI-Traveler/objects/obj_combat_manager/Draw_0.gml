draw_set(,, fa_center, fa_middle);

// Draw player combatants
var _xpad = 800;
var _l = (ROOM_W * 0.4) - _xpad;
var _ypad = 100;
var _t = ROOM_H_H + _ypad;
for (var i = 0; i < array_length(PARTY); i++) {
	var _combatant = PARTY[i];
	var _x = _l + (_combatant.col * _xpad);
	var _y = _t + (_combatant.row * _ypad);
	draw_text(_x, _y, $"{_combatant.name}: {_combatant.hp}");
}
draw_text(100, _t, "Row 0");
draw_text(100, _t + _ypad, "Row 1");

// Draw enemy combatants
var _l = (ROOM_W * 0.4) - _xpad;
var _b = ROOM_H_H - _ypad;
for (var i = 0; i < array_length(ENEMY_PARTY); i++) {
	var _combatant = ENEMY_PARTY[i];
	var _x = _l + (_combatant.col * _xpad);
	var _y = _b - (_combatant.row * _ypad);
	draw_text(_x, _y, $"{_combatant.name}: {_combatant.hp}");
}
draw_text(100, _b, "Row 0");
draw_text(100, _b - _ypad, "Row 1");

// Draw the combat log
draw_set(, fnt_droid_serif_30, fa_right);
var _x = ROOM_W;
var _y = ROOM_H * 0.9;
var _size = array_length(combat_log);
for (var i = _size-1; i >= 0; i--) {
	var _line = combat_log[i];
	draw_text(_x, _y, _line);
	_y -= font_height();
}