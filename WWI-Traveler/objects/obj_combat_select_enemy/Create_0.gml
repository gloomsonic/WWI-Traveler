event_inherited();

self[$ "my_combatant"] ??= noone;
obj_cursor_combat.add_touchable(id);

draw_set(c_black,, fa_center, fa_middle);
image_xscale = 700 / sprite_width;
image_yscale = string_height(my_combatant.name) / sprite_height;

// Scale to actor
var _actor = combatant_get_actor(my_combatant);
x = _actor.x;
y = _actor.y;
var _w = _actor.bbox_right - _actor.bbox_left;
var _h = _actor.bbox_bottom - _actor.bbox_top;
image_xscale = _w / sprite_get_width(sprite_index);
image_yscale = _h / sprite_get_height(sprite_index);