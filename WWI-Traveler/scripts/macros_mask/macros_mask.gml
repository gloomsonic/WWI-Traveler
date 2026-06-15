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

#macro SPR_L (x - sprite_xoffset)
#macro SPR_R (SPR_L + sprite_width)
#macro SPR_T (y - sprite_yoffset)
#macro SPR_B (SPR_T + sprite_height)

#macro SPR_W sprite_width
#macro SPR_W_H (SPR_W / 2)
#macro SPR_H sprite_height
#macro SPR_H_H (SPR_H / 2)

#macro SPR_X_C (SPR_L + SPR_W_H)
#macro SPR_Y_C (SPR_T + SPR_H_H)