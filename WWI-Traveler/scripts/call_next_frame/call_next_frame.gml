// Shortcut to 'call_later()' 1 frame from now
function call_next_frame(_callback) {
	call_later(1, time_source_units_frames, _callback)
}