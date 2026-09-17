timer = 0;
duration = 30;

update = function() {
	timer++;
	return timer >= duration;
}