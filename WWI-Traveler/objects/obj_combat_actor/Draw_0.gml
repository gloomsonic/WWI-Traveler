draw_set(, fnt_droid_serif_30, fa_center, fa_middle);
draw_self_ext();

var _y = BBOX_T - 16;
draw_text(x, _y, my_combatant.hp);
_y -= 40;
draw_text(x, _y, my_combatant.inventory.bullets);
_y -= 40;
draw_text(x, _y, my_combatant.name);