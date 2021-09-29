/// @description Insert description here
// You can write your code in this editor
up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_pressed(ord("I"));

pos += down_key - up_key;
if (pos >= op_length) {
	pos = 0;
}
if (pos < 0) {
	pos = op_length-1;
}

if (accept_key) {
	switch(pos) {
		case 0: {
			room_goto_next();
		} break;
		case 1: {
		} break;
		case 2: {
		} break;
	}
}