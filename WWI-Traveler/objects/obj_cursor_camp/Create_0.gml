event_inherited();

states.define(State.camp_free, state_cursor_camp_free);
states.define(State.camp_formation, state_cursor_camp_formation);
states.queue(State.camp_free);