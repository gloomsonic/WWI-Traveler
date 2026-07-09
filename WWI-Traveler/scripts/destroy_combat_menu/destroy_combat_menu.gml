// Destroy all the objects associated with the player's combat menu
function destroy_combat_menu() {
	instance_destroy(par_combat_menu);
	instance_destroy(obj_combat_menu_label);
}