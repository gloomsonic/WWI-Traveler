#macro VIEW view_camera[0]

#macro VIEW_W camera_get_view_width(VIEW)
#macro VIEW_W_H (VIEW_W / 2)
#macro VIEW_H camera_get_view_height(VIEW)
#macro VIEW_H_H (VIEW_H / 2)

#macro VIEW_X camera_get_view_x(VIEW)
#macro VIEW_Y camera_get_view_y(VIEW)
#macro VIEW_R (VIEW_X + VIEW_W)
#macro VIEW_B (VIEW_Y + VIEW_H)

#macro VIEW_XC (VIEW_X + VIEW_W_H)
#macro VIEW_YC (VIEW_Y + VIEW_H_H)

#macro ROOM_W room_width
#macro ROOM_W_H (ROOM_W / 2)
#macro ROOM_H room_height
#macro ROOM_H_H (ROOM_H / 2)