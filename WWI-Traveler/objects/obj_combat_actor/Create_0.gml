self [$ "my_combatant"] ??= noone;

// Set scaling to imply perspective
if (my_combatant.team == Combatant_Team.player) {
	image_xscale = 1.5;
	image_yscale = 1.5;
	if (my_combatant.row == 0) {
		image_xscale = 1.2;
		image_yscale = 1.2;
	}
} else {
	image_xscale = 0.9;
	image_yscale = 0.9;
	if (my_combatant.row == 1) {
		image_xscale = 0.65;
		image_yscale = 0.65;
	}
}

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