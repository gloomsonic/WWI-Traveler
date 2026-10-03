enum Attack_Type {melee, ranged}

// Weapons 
function weapon(_damage_melee, _accuracy_melee, _damage_ranged, _accuracy_ranged, _name) constructor {
	damage_melee = _damage_melee;
	accuracy_melee = _accuracy_melee;
	damage_ranged = _damage_ranged;
	accuracy_ranged = _accuracy_ranged;
	name = _name;
	
	ammo_max = 1;
	ammo_remaining = 1;
	reload = function() {
		ammo_remaining = ammo_max;		
	}
}

// Weapons
#macro GUN new weapon(2, 90, 6, 50, "Gun")
#macro FIST new weapon(1, 85, -1, -1, "Fist") // TODO: if '-1' ranged damage, then no shoot button