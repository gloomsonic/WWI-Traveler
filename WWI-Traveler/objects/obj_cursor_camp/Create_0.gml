event_inherited();

states.define(State.camp_free, state_cursor_camp_free);
states.define(State.camp_formation, state_cursor_camp_formation);
states.queue(State.camp_free);

// Methods: state_cursor_camp_formation
my_formation_space = noone;
set_formation_space = function(_space) {
	my_formation_space = _space;
}
get_formation_space = function() {
	return my_formation_space;
}