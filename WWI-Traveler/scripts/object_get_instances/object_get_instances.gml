function object_get_instances(_obj) {
	var _instances = [];
	with (_obj) {
		array_push(_instances, id);
	}
	return _instances;
}