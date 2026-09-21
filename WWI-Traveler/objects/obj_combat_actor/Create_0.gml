timer = 0;
duration = 30;

update = function() {
	timer++;
	return timer >= duration;
}

reset = function() {
	sprite_index = spr_combatant_idle;
	timer = 0
}