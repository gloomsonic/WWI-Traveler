draw_set(, fnt_droid_serif_30, fa_center, fa_middle);
draw_self_ext();

var _y = y + 16;
draw_text(x, _y, my_combatant.name);
_y += font_height();
draw_text(x, _y, my_combatant.hp);