event_inherited();

self[$ "my_data"] ??= {}; // reference to global combatant data
refresh();

ready = true;
flash_count = 3;
flash_duration = 4;
flash_remaining = -1;
states.define(State.evaded, state_evaded);
states.define(State.hit, state_hit);
states.define(State.attack, state_attack);

