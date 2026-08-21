// A list of all FMOD Busses, Event References and Parameters


// ----------------- AUDIO BUS -----------------

// --- BUSES (paths must match FMOD Studio exactly; "bus:/" is the Master Bus) ---
#macro AUDIO_BUS_MASTER    "bus:/"
#macro AUDIO_BUS_SFX       "bus:/SFX"
#macro AUDIO_BUS_MUSIC     "bus:/Music"
#macro AUDIO_BUS_AMBIENCE  "bus:/Ambience"


// ----------------- UTILITIES -----------------

// Helps match GM Pixels to units that FMOD uses
#macro AUDIO_WORLD_METERS 20

// ----------------- PARAMETERS -----------------
// Parameter Tester
#macro PITCH_TEST_PARAMETER "PITCH_TEST_PARAMETER"

// ----------------- AUDIO EVENTS -----------------

// SFX
#macro EV_GUNSHOT   "event:/SFX/Test Gunshot"
#macro EV_PUNCH   "event:/SFX/Test Punch"
#macro EV_MISS   "event:/SFX/Test Miss"
#macro EV_TYPEWRITER "event:/SFX/Typewriter"
#macro EV_AMBIENCE   "event:/Ambience/Amb_War/Amb_War"

// MUSIC
#macro EV_MUSIC "event:/Music/Music"

