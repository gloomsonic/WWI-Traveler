event_user_all();

// Player combatants
instance_create_layer(ROOM_W*1/15,	0.77*ROOM_H, "spaces", obj_combatant2, {my_data : PARTY[0][0]});
instance_create_layer(ROOM_W*5/15,	0.77*ROOM_H, "spaces", obj_combatant2, {my_data : PARTY[0][1]});
instance_create_layer(ROOM_W*9/15,	0.77*ROOM_H, "spaces", obj_combatant2, {my_data : PARTY[0][2]});
instance_create_layer(ROOM_W*13/15, 0.77*ROOM_H, "spaces", obj_combatant2, {my_data : PARTY[0][3]});

instance_create_layer(ROOM_W*3/15,	0.92*ROOM_H, "spaces", obj_combatant2, {my_data : PARTY[1][0]});
instance_create_layer(ROOM_W*7/15,	0.92*ROOM_H, "spaces", obj_combatant2, {my_data : PARTY[1][1]});
instance_create_layer(ROOM_W*11/15, 0.92*ROOM_H, "spaces", obj_combatant2, {my_data : PARTY[1][2]});

// Enemy combatants
instance_create_layer(ROOM_W*2/15,	0.47*ROOM_H, "spaces", obj_combatant2, {my_data : ENEMY_PARTY[0][0]});
instance_create_layer(ROOM_W*6/15,	0.47*ROOM_H, "spaces", obj_combatant2, {my_data : ENEMY_PARTY[0][1]});
instance_create_layer(ROOM_W*10/15,	0.47*ROOM_H, "spaces", obj_combatant2, {my_data : ENEMY_PARTY[0][2]});
instance_create_layer(ROOM_W*14/15, 0.47*ROOM_H, "spaces", obj_combatant2, {my_data : ENEMY_PARTY[0][3]});

instance_create_layer(ROOM_W*4/15,	0.32*ROOM_H, "spaces", obj_combatant2, {my_data : ENEMY_PARTY[1][0]});
instance_create_layer(ROOM_W*8/15,	0.32*ROOM_H, "spaces", obj_combatant2, {my_data : ENEMY_PARTY[1][1]});
instance_create_layer(ROOM_W*12/15, 0.32*ROOM_H, "spaces", obj_combatant2, {my_data : ENEMY_PARTY[1][2]});