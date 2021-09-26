/// @description Insert description here
// You can write your code in this editor
if (global.playerHealth > 0) {
	global.playerHealth -= delta_time/1000000;
} else {
	global.playerHealth = 0;
	obj_player.state = PlayerStateDead;
}
playerHealth = ceil(global.playerHealth);