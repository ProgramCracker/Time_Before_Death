// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewTextBox(){
var _obj;
if (instance_exists(obj_text)) 
{ 
	_obj = obj_textQueue;
} else {
	_obj = obj_text;
}

with (instance_create_layer(0, 0, "Instances", _obj)) {
	message = argument[0];
	if (instance_exists(other)) {
		originInstance = other.id;
	} else {
		originInstance = noone;
	}
	if (argument_count > 1) {
		background = argument[1];
	} else {
		background = 1;
	}
	if (argument_count > 2) {
		responses = argument[2];
		for (var i = 0; i < array_length(responses); i++) {
			var _markerPosition = string_pos(":",responses[i]);
			responseScripts[i] = string_copy(responses[i], 1, _markerPosition-1);
			responseScripts[i] = real(responseScripts[i]);
			responses[i] = string_delete(responses[i], 1, _markerPosition);
			breakpoint = 10;
		}
	} else {
		responses = [-1];
		responseScripts = [-1];
	}
}
	
	with (obj_player) {
		if (state != PlayerStateLocked) {
			lastState = state;
			state = PlayerStateLocked;
		}
	}
}