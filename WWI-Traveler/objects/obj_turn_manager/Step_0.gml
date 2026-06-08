/*
	structs for each of the combat actors are provided to this object at the start of combat
	- for now, just put them in manually
	turn manager orders them by speed
	turn manager cycles to 'next actor' when a turn ends
	- need some sort of 'turn over' callback or flag
	- if the actor is a CPU, it runs some kind of script to automatically make choice
	- if the actor is player-controlled, manipulable 'select action' objects are created
*/

if (turn_done) {
	var _combatant = array_shift(turn_queue);
	array_push(turn_queue, _combatant);
	// log(array_get_index(combatants, _combatant));
}