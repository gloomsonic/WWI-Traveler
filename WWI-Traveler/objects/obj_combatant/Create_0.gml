event_inherited();

self[$ "my_data"] ??= {}; // reference to global combatant data
refresh();

ready = true;
flash_count = 3;
flash_duration = 4;
flash_remaining = -1;
states.define(State.attack, state_combatant_attack);
states.define(State.guard, state_combatant_guard);
states.define(State.hit, state_combatant_hit);
states.define(State.evaded, state_combatant_evaded);

