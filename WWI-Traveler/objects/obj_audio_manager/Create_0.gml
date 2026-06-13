// Initializes FMOD with appropriate settings.

// Make it a Singleton
if (instance_number(object_index) > 1)
{
    fmod_ready = false;
    instance_destroy();
    exit;
}

// Sets max amount of audio sounds that can be played
var max_channels = 1024;
var fmod_flag = FMOD_STUDIO_INIT.NORMAL; 
var core_flag = FMOD_INIT.NORMAL;

fmod_ready = false;

// Create FMOD Studio
fmod_studio_system_create();
fmod_studio_system_init(max_channels, fmod_flag, core_flag);

// Load the sound banks and check if they're ready
var strings_bank_ref = fmod_studio_system_load_bank_file(fmod_path_bundle("FMOD Banks/Desktop/Master.strings.bank"), FMOD_STUDIO_LOAD_BANK.NORMAL);
var master_strings_ok = (fmod_last_result() == FMOD_RESULT.OK);
var master_bank_ref  = fmod_studio_system_load_bank_file(fmod_path_bundle("FMOD Banks/Desktop/Master.bank"), FMOD_STUDIO_LOAD_BANK.NORMAL);
var master_bank_ok = (fmod_last_result() == FMOD_RESULT.OK);
	
fmod_ready = master_strings_ok && master_bank_ok;

event_desc_cache = {};
param_id_cache	 = {};
bus_cache        = {};
active           = {};

// Load saved volume settings and push them to the buses
audio_settings_init();
if (fmod_ready) audio_volumes_apply();