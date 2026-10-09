///@desc delete path sprites
for (var i = 0; i < array_length(path_sprites); i++) {
	var _spr = path_sprites[i];
	sprite_delete(_spr);
}