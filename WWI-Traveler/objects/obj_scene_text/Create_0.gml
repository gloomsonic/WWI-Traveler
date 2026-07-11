event_user_all();

// Commit states
states = new use_states();
states.define(State.reading, state_scene_reading);
states.define(State.waiting, state_scene_waiting);
states.define(State.choosing, state_scene_choosing);
states.queue(State.reading);

// Scene to play
my_scene = (global.pending_scene != noone) ? global.pending_scene : PATH_BIOMES.none[0];

// Prep text formatting
draw_set();
line_spacing = 1.4;
l_margin = ROOM_W_H - LINE_W_H;
story_bot_y = 0;
story_character_count = story_get_char_count(my_scene.story);
choice_spacing = 2.0;
choice_break = font_height() * 4.0

char_spd = 6;
scroll_spd = font_height() * line_spacing;
awaiting_input = false;

fade_spd = 0.04;
fade_values = [];
characters_opaque_count = 0;

