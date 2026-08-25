event_user_all();
turn_over = true;

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

// Set turn order
var _combatants = combatants_get_all(); //object_get_instances(obj_combatant);
turn_order = array_shuffle(_combatants);