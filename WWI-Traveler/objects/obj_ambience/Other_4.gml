switch (room) {
    case rm_camp:
	case rm_map: // NOTE: map is inside of camp, not sure if this is the correct way to tell it 'keep playing whatever was playing during camp'
		fmod_studio_system_set_parameter_by_name_with_label(SCENE_AUDIO, "Camp");
        break;
	case rm_combat:
        fmod_studio_system_set_parameter_by_name_with_label(SCENE_AUDIO, "Combat");
        break;

    case rm_scene:
		if (SCENE_NEXT == noone) break;
		switch (SCENE_NEXT.name) {			
            case "grove":
                fmod_studio_system_set_parameter_by_name_with_label(SCENE_AUDIO, "Grove");
                break;
            default:
                fmod_studio_system_set_parameter_by_name_with_label(SCENE_AUDIO, "None");
                break;
        }
        break;
}