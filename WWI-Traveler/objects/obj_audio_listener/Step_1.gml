if (view_enabled && view_visible[0])
{
    var cam = view_camera[0];
    if (cam != -1)
    {
        x = camera_get_view_x(cam) + camera_get_view_width(cam)  * 0.5;
        y = camera_get_view_y(cam) + camera_get_view_height(cam) * 0.5;
    }
}