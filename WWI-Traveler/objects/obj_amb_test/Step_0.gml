// Click and Drag for Audio Listener Testing
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id))
    dragging = true;
if (!mouse_check_button(mb_left))
    dragging = false;
if (dragging)
{
    x = mouse_x;
    y = mouse_y;
}

// Control to test parameter usage.
if (keyboard_check_pressed(ord("W"))) audio_param_add("ambience", PITCH_TEST_PARAMETER,  0.10);
if (keyboard_check_pressed(ord("S"))) audio_param_add("ambience", PITCH_TEST_PARAMETER, -0.10);
if (keyboard_check_pressed(ord("A"))) audio_stop_tracked("ambience", true);
if (keyboard_check_pressed(ord("D"))) audio_play_tracked_3d("ambience", EV_DEBUG_AMBIENCE, x, y);

audio_set_position("ambience", x, y);