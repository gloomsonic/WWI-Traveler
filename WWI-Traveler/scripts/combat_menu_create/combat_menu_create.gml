function combat_menu_create(_active_combatant) {
	var _y = ROOM_H * 0.93;
	var _buttons = [];
	var _font = fnt_droid_serif_48;
	var _w = 512;
	var _h = font_height(_font) * 1.5;		
		
	// Combatant name
	instance_create_depth(ROOM_W * 0.05, _y, depth, obj_combat_menu_label, {
		active_combatant: _active_combatant,
	});		
		
	// Create buttons for the array
	var _new = combat_menu_button_create(_active_combatant, obj_combat_menu_attack_melee, _w, _h, _font, combat_callback_on_attack_melee_selected);
	array_push(_buttons, _new);
	if (_active_combatant.my_weapon.damage_ranged != -1) { // Shoot vs. Reload button
		if (_active_combatant.my_weapon.ammo_remaining > 0)
			_new = combat_menu_button_create(_active_combatant, obj_combat_menu_attack_ranged, _w, _h, _font, combat_callback_on_attack_ranged_selected);
		else
			_new = combat_menu_button_create(_active_combatant, obj_combat_menu_reload, _w, _h, _font, combat_callback_reload);
		array_push(_buttons, _new);
	}
	_new = combat_menu_button_create(_active_combatant, obj_combat_menu_move, _w, _h, _font, combat_callback_on_move_selected);
	array_push(_buttons, _new);
	_new = combat_menu_button_create(_active_combatant, obj_combat_menu_pass, _w, _h, _font, combat_callback_pass);
	array_push(_buttons, _new);
		
	// Position buttons on the array
	var _size = array_length(_buttons);
	var _l = ROOM_W_H - ((_w * _size) / 2);
	var _x = _l + (_w / 2); // Centered origin offset

	for (var i = 0; i < array_length(_buttons); i++) {
		var _button = _buttons[i];
		_button.x = _x;
		_button.y = _y;
		_x += _w;
	}
}