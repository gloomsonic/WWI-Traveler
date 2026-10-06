switch (room) {
    case rm_camp:
		fmod_studio_system_set_parameter_by_name_with_label(SCENE_AUDIO, "Camp");
        break;
    case rm_map:
        fmod_studio_system_set_parameter_by_name_with_label(SCENE_AUDIO, "Camp");
        break;
	case rm_combat:
        fmod_studio_system_set_parameter_by_name_with_label(SCENE_AUDIO, "Combat");
        break;

    case rm_scene:
        //if (!is_struct(global.pending_scene)) break;
		var _scene = obj_scene_text.my_scene; // HACK: I shouldn't directly reference obj_scene_text like this; just testing rn
        switch (_scene.name) {
            case "grove":
                fmod_studio_system_set_parameter_by_name_with_label(SCENE_AUDIO, "Grove");
                break;
        }
        break;
}