self [$ "my_combatant"] ??= noone;
combat_actor_methods();

states = new use_states();
states.define(State.combat_idle, state_actor_idle);
states.define(State.combat_attack_melee, state_actor_attack_melee);
states.define(State.combat_attack_ranged, state_actor_attack_ranged);
states.define(State.combat_move, state_actor_move);
states.define(State.combat_hit, state_actor_hit);
states.define(State.combat_die, state_actor_die);
states.queue(State.combat_idle);

update_scale();