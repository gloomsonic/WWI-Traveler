event_user_all();

// Player combatants
instance_create_layer(ROOM_W*7/20,	0.77*ROOM_H, "spaces", obj_combatant, {my_data : PARTY[0][0]});
instance_create_layer(ROOM_W*11/20,	0.77*ROOM_H, "spaces", obj_combatant, {my_data : PARTY[0][1]});
instance_create_layer(ROOM_W*15/20, 0.77*ROOM_H, "spaces", obj_combatant, {my_data : PARTY[0][2]});

instance_create_layer(ROOM_W*5/20,	0.92*ROOM_H, "spaces", obj_combatant, {my_data : PARTY[1][0]});
instance_create_layer(ROOM_W*9/20,	0.92*ROOM_H, "spaces", obj_combatant, {my_data : PARTY[1][1]});
instance_create_layer(ROOM_W*13/20, 0.92*ROOM_H, "spaces", obj_combatant, {my_data : PARTY[1][2]});

// Enemy combatants
instance_create_layer(ROOM_W*6/20,	0.47*ROOM_H, "spaces", obj_combatant, {my_data : ENEMY_PARTY[0][0]});
instance_create_layer(ROOM_W*10/20,	0.47*ROOM_H, "spaces", obj_combatant, {my_data : ENEMY_PARTY[0][1]});
instance_create_layer(ROOM_W*14/20, 0.47*ROOM_H, "spaces", obj_combatant, {my_data : ENEMY_PARTY[0][2]});

instance_create_layer(ROOM_W*4/20,	0.32*ROOM_H, "spaces", obj_combatant, {my_data : ENEMY_PARTY[1][0]});
instance_create_layer(ROOM_W*8/20,	0.32*ROOM_H, "spaces", obj_combatant, {my_data : ENEMY_PARTY[1][1]});
instance_create_layer(ROOM_W*12/20, 0.32*ROOM_H, "spaces", obj_combatant, {my_data : ENEMY_PARTY[1][2]});

// Spawn combat menu -- TODO: functionize and do on player turn
var _player = get_combatant_team(Combatant_Team.player); // DEBUG: starting combatant
	
var _lh = sprite_get_height(spr_combat_menu_attack);
var _y = ROOM_H - 500;
instance_create_layer(0, _y, "menu", obj_combat_menu_label, {my_combatant: _player[0]});
instance_create_layer(0, _y, "menu", obj_combat_menu_attack);
_y += _lh;
instance_create_layer(0, _y, "menu", obj_combat_menu_guard);
_y += _lh;
instance_create_layer(0, _y, "menu", obj_combat_menu_reposition);
_y += _lh;
instance_create_layer(0, _y, "menu", obj_combat_menu_pass);

// Turn order
/*	
- randomize turn order.
- 'pick' the first guy and send him to the cursor (step event?)
- if it's a player, spawn the combat menu (step event)
- if it's a CPU... pick a player and 'start_attack' between them (step event)
*/
var _combatants = object_get_instances(obj_combatant);
turn_order = array_shuffle(_combatants);