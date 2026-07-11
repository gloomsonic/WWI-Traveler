randomize();
display_reset(8, true);

// Map playthrough state allows us to traverse back to the "current node" when exiting combat or scenes
global.map_current_node = -1;   // node_id the player is standing on
global.map_play_slot    = -1;   // which map slot the current playthrough is on
global.map_resume       = false;// true when re-entering rm_map should resume play, not edit
global.pending_scene = noone;   // scene queued by the map for rm_scene to play

instance_create_depth(0, 0, 0, obj_room_start);
instance_create_depth(0, 0, 0, obj_camera);
instance_create_depth(0, 0, 0, obj_audio_manager);
instance_create_depth(ROOM_W_H, ROOM_H_H, 0, obj_audio_listener);

room_goto(rm_start);