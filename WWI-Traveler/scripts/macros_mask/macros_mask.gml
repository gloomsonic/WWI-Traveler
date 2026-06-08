#macro BBOX_R bbox_right
#macro BBOX_T bbox_top
#macro BBOX_L bbox_left
#macro BBOX_B bbox_bottom

#macro BBOX_W (bbox_right - bbox_left)
#macro BBOX_W_H (BBOX_W / 2)
#macro BBOX_H (bbox_bottom - bbox_top)
#macro BBOX_H_H (BBOX_H / 2)

#macro BBOX_X_C (BBOX_L + BBOX_W_H)
#macro BBOX_Y_C (BBOX_T + BBOX_H_H)