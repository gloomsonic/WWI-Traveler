// Draw enemy team
var _x = ROOM_W_H;
var _y = ROOM_H_H;
for (var i = 0; i < array_length(team_enemy); i++) {
	draw_self_ext(spr_combatant,, _x, _y);
	_x += 256;
}

// Draw player team
var _x = ROOM_W_H;
var _y = ROOM_H * 0.75;
for (var i = 0; i < array_length(team_player); i++) {
	draw_self_ext(spr_combatant,, _x, _y);
	_x += 256;
}