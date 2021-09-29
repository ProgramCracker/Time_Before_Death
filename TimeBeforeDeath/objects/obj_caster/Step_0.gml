/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (enemyHP < 100) {
	alarm[0] = 2 * room_speed;
}

if (enemyHP <= 0) {
	obj_player.staff = 1;
}