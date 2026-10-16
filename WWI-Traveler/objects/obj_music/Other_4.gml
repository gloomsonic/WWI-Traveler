switch (room) {
    case rm_camp:
		fmod_studio_system_set_parameter_by_name_with_label(SCENE_AUDIO, "Camp");
        break;
    case rm_map:
        fmod_studio_system_set_parameter_by_name_with_label(SCENE_AUDIO, "Menu");
        break;
	case rm_combat:
        fmod_studio_system_set_parameter_by_name_with_label(SCENE_AUDIO, "Combat");
        break;

    case rm_scene:
		if (NEXT_SCENE == noone) break;
		switch (NEXT_SCENE.name) {
            case "grove":
                fmod_studio_system_set_parameter_by_name_with_label(SCENE_AUDIO, "Grove");
                break;
        }
        break;
}