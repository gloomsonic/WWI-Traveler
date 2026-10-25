// Highlight active combatant
if (active_combatant != noone) {
	var _actor = combatant_get_actor(active_combatant);
	var _x = _actor.x;
	var _y = _actor.y;
	
	var _w = _actor.bbox_right - _actor.bbox_left;
	var _h = _actor.bbox_bottom - _actor.bbox_top;
	var _xscale = _w / sprite_get_width(spr_combat_active_highlight);
	var _yscale = _h / sprite_get_height(spr_combat_active_highlight);
	draw_self_ext(spr_combat_active_highlight, 0, _x, _y, _xscale, _yscale);
}

// TODO: make the circles go away when combat 'starts', use a signal?
for (var i = 0; i < array_length(PARTY); i++) {
	var _combatant = PARTY[i];
	var _actor = combatant_get_actor(_combatant);
	
	if (_combatant == active_combatant) {
		draw_circle_color(_actor.x, _actor.y, 16, c_blue, c_blue, false);
	} else {
		var _turn_index = array_get_index(turn_order, _combatant);
		if (_turn_index == -1)
			draw_circle_color(_actor.x, _actor.y, 16, c_red, c_red, false);
		else
			draw_circle_color(_actor.x, _actor.y, 16, c_white, c_white, false);
	}
}