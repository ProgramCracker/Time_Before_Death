/// @description Insert description here
// You can write your code in this editor

// movement keys
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

// interaction and attack keys
key_int = keyboard_check_pressed(ord("I"));
key_attack = keyboard_check_pressed(ord("K"));

// make player face correct direction
inputDirection = point_direction(0,0, key_right - key_left, key_down - key_up);
inputMagnitude = (key_right - key_left != 0) || (key_down - key_up != 0);

// state executable
if (!global.gamePaused) {
	script_execute(state);
}

// find depth of player (layer thing)
depth = -bbox_bottom;