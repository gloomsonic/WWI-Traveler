event_inherited();

my_combatant = noone;

get_combatant = function() {
	return my_combatant;
}
set_combatant = function(_combatant) {
	my_combatant = _combatant;
	my_combatant.set_space(id);
}
free = function() {
	my_combatant = noone;
}