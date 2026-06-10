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

if (keyboard_check_pressed(vk_space))
{
	audio_oneshot_3d(EV_DEBUG_SFX, x, y);
}