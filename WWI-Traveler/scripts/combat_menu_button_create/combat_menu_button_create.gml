// Combat menu button for the supplied combatant
function combat_menu_button_create(_combatant, _obj, _w, _h, _font, _callback) {
	var _new = instance_create_depth(0, 0, depth, _obj, {
		my_combatant: _combatant,
		callback: _callback,
		font: _font,
		w: _w,
		h: _h,
	});
	return _new;
}