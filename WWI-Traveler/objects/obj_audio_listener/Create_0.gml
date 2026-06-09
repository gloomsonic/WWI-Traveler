// An object that acts as the "ears" for the player. 3D sounds will revolve around it.

// Make it a Singleton
if (instance_number(object_index) > 1) {
    instance_destroy();
    exit;
}