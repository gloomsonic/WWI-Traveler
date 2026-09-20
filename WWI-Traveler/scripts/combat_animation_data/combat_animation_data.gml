//
function cutscene_attack(_attacker, _target) constructor {
	attacker = _attacker;
	target = _target;
	lanes = [_attacker, _target];
	inst = noone;
	
	// Increment or destroy animation object
	update = function() {
		if (!instance_exists(inst))
			inst = instance_create_depth(ROOM_W_H, ROOM_H_H, 0, obj_combat_animation, {
				sprite_index: spr_combatant_attack,
			});
		var _done = inst.update();
		if (_done) instance_destroy(inst);	
		return _done;
	}
}

//
function cutscene_hit(_target, _damage) constructor {
	target = _target;
	damage = _damage;
	lanes = [_target];
	inst = noone;
	
	// Increment or destroy animation object
	update = function() {
		if (!instance_exists(inst))
			inst = instance_create_depth(ROOM_W_H, ROOM_H_H, 0, obj_combat_animation, {
				sprite_index: spr_combatant_guard,
			});
		var _done = inst.update();
		if (_done) instance_destroy(inst);	
		return _done;
	}
}