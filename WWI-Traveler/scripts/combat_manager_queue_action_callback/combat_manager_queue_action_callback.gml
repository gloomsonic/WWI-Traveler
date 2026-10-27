// Queue a combat 
function combat_manager_queue_action_callback(_action_callback, _active_combatant, _args = []) {
	var _data = {
		callback: _action_callback,
		active_combatant: _active_combatant,
		args: _args,
	}
	
	with (obj_combat_manager) {
		array_push(combat_callbacks_queue, _data);
		turn_end();
	}
	instance_destroy(obj_combat_select_back); // If there is one, it needs to not be
}