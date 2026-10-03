// A list of all FMOD Busses, Event References and Parameters


// ----------------- AUDIO BUS -----------------

// --- BUSES (paths must match FMOD Studio exactly; "bus:/" is the Master Bus) ---
#macro AUDIO_BUS_MASTER			"bus:/"
#macro AUDIO_BUS_SFX			"bus:/SFX"
#macro AUDIO_BUS_MUSIC			"bus:/Music"
#macro AUDIO_BUS_AMBIENCE		"bus:/Ambience"


// ----------------- UTILITIES -----------------

// Helps match GM Pixels to units that FMOD uses
#macro AUDIO_WORLD_METERS 20

// ----------------- PARAMETERS -----------------
// Parameter Tester
#macro PITCH_TEST_PARAMETER		"PITCH_TEST_PARAMETER"
#macro SCENE_AUDIO				"Scene Audio"

// ----------------- AUDIO EVENTS -----------------

// SFX
#macro EV_GUNSHOT				"event:/SFX/Combat/Test Gunshot"
#macro EV_PUNCH					"event:/SFX/Combat/Test Punch"
#macro EV_MISS					"event:/SFX/Combat/Test Miss"
#macro EV_TYPEWRITER			"event:/SFX/Scene/General/Typewriter"
#macro EV_TYPEWRITER_END		"event:/SFX/Scene/General/Typewriter_End"

// Grove
#macro EV_GROVE_BUSHES			"event:/SFX/Scene/Grove/snd_grove_bushes"

// Ambience
#macro EV_AMBIENCE				"event:/Ambience/Ambience"

// MUSIC
#macro EV_MUSIC					"event:/Music/Music"

