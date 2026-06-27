#macro MAP_NODE_DIAMETER 32
#macro MAP_NODE_FEATURES ["Plain", "City", "Mountain", "Swamp", "Forest", "River" ]


// Returns a color representing a geographical feature of a node
function node_feature_color(_index){
	switch(_index)
	{
		case 1:  return c_red;		// city
		case 2:  return c_gray;		// mountain
		case 3:  return c_purple;	// swamp
		case 4:  return c_green;	// forest
		case 5:  return c_aqua;		// river
		default: return c_white;	// plain	
	}
}