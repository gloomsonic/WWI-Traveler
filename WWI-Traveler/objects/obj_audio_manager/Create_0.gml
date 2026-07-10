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

// Load the sound banks and check if they're ready.
// NOTE: GameMaker deploys Included Files verbatim on Windows, but lowercases
// paths and converts spaces->underscores on macOS/Linux. Reference the name
// each platform actually deploys, or the bank load silently fails.
var _bank_dir, _strings_file, _master_file;
if (os_type == os_windows)
{
    _bank_dir     = "FMOD Banks/Desktop/";
    _strings_file = "Master.strings.bank";
    _master_file  = "Master.bank";
}
else
{
    _bank_dir     = "fmod_banks/desktop/";
    _strings_file = "master.strings.bank";
    _master_file  = "master.bank";
}

var strings_bank_ref = fmod_studio_system_load_bank_file(fmod_path_bundle(_bank_dir + _strings_file), FMOD_STUDIO_LOAD_BANK.NORMAL);
var master_strings_ok = (fmod_last_result() == FMOD_RESULT.OK);
var master_bank_ref  = fmod_studio_system_load_bank_file(fmod_path_bundle(_bank_dir + _master_file), FMOD_STUDIO_LOAD_BANK.NORMAL);
var master_bank_ok = (fmod_last_result() == FMOD_RESULT.OK);

fmod_ready = master_strings_ok && master_bank_ok;

event_desc_cache = {};
param_id_cache	 = {};
bus_cache        = {};
active           = {};

// Load saved volume settings and push them to the buses
audio_settings_init();
if (fmod_ready) audio_volumes_apply();