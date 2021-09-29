/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (enemyHP < 300) {
	alarm[0] = 2 * room_speed;
	state = ENEMYSTATE.CHASE;
}