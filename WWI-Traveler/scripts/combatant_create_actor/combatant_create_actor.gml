function combatant_create_actor(_combatant) {
	instance_create_depth(0, 0, depth, obj_combat_actor, {
		x: 400 + (_combatant.col * 400),
		y: 400 + (_combatant.row * 400),
		sprite_index: spr_combatant_idle,
		my_combatant: _combatant,
	});
}