// Highlight active combatant
if (active_combatant != noone) {
	var _actor = combatant_get_actor(active_combatant);
	var _x = _actor.x;
	var _y = _actor.y;
	
	var _w = _actor.bbox_right - _actor.bbox_left;
	var _h = _actor.bbox_bottom - _actor.bbox_top;
	var _xscale = _w / sprite_get_width(spr_combat_active_highlight);
	var _yscale = _h / sprite_get_height(spr_combat_active_highlight);
	draw_self_ext(spr_combat_active_highlight, 1, _x, _y, _xscale, _yscale);
}