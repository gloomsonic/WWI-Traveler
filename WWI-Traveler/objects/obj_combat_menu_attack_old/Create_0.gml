event_inherited();

self[$ "my_combatant"] ??= noone;
states.define(State.selected, state_selected);

signal_add(new signal_listener(id, Signal_Type.on_combat_target_done, function() {
	states.queue(State.idle);
}))