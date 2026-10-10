event_user_all();
scene_text_methods_step();
scene_text_methods_draw();

// Commit states
states = new use_states();
states.define(State.reading, state_scene_reading);
states.define(State.waiting, state_scene_waiting);
states.define(State.choosing, state_scene_choosing);
states.queue(State.reading);

// Load the scene to play
var _scene = scene_get("grove"); // TODO: don't just call the same story forever lmao
my_scene = variable_clone(_scene);
instance_create_depth(0, 0, depth+1, obj_scene_image, {
	sprite_index: my_scene.sprite,
	image_index: 0,
})
sprite_prefetch(my_scene.sprite);

// Prep text formatting
font = SCENE_FONT;
draw_set(font);
line_spacing = 1.4;
l_margin = ROOM_W*0.70;
story_bot_y = 0;
story_character_count = story_get_char_count(my_scene.story);
choice_spacing = 2.0;
choice_break = font_height() * 4.0

// Text rendering
char_spd = 3; //6;
scroll_spd = font_height(font) * line_spacing;
fade_spd = 0.05;
fade_values = [];
characters_opaque_count = 0;

//
sounds = {};