// Inherit the parent event
event_inherited();

self [$ "row"] ??= -1;
self [$ "pos"] ??= -1;
self [$ "name"] ??= "!NO NAME!";

//signal_add(new signal_listener(id, Signal_Type.on_formation_space_selected, function() {
//	image_blend = c_white;
//}));