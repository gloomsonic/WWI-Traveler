event_inherited();

// Set the node size based off macro value
image_xscale = MAP_NODE_DIAMETER / sprite_get_width(sprite_index);
image_yscale = image_xscale;

node_id = -1;
feature = 0;
image_blend = node_feature_color(feature);