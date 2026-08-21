function swap_combatant_datas(_row1, _pos1, _row2, _pos2) {
			
	// Get combatants
	var _cmb_data_1 = global.data.party[_row1][_pos1];
	var _cmb_data_2 = global.data.party[_row2][_pos2];
			
	array_insert(global.data.party[_row1], _pos1, _cmb_data_2); // Other combatant inserted in my combatant's index
	array_delete(global.data.party[_row1], _pos1+1, 1); // My combatant deleted
	array_insert(global.data.party[_row2], _pos2, _cmb_data_1); // My combatant inserted at other combatant's index
	array_delete(global.data.party[_row2], _pos2+1, 1); // Other combatant deleted
}