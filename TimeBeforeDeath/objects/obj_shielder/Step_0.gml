/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (enemyHP < 100) {
	state = ENEMYSTATE.CHASE;
}

if (enemyHP <= 0) {
	obj_player.shield = 1;
}