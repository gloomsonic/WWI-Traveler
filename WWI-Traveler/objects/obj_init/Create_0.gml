instance_create_depth(0, 0, 0, obj_room_start);
instance_create_depth(0, 0, 0, obj_camera);
instance_create_depth(0, 0, 0, obj_audio_manager);
instance_create_depth(ROOM_W_H, ROOM_H_H, 0, obj_audio_listener);

room_goto(rm_start);