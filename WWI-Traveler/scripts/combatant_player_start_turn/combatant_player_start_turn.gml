function combatant_player_start_turn(_combatant) {
	combat_menu_create(_combatant);
	_combatant.set_ready(false);
	obj_cursor_combat.set_combatant(_combatant);
	obj_cursor_combat.states.queue(State.select_action);
}