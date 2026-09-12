// Shortcut to 'call_later()' X frames from now
function call_later_frames(_frames, _callback){
	call_later(_frames, time_source_units_frames, _callback)
}