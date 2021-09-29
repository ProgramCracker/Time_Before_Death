/// @description Insert description here
// You can write your code in this editor
if (global.playerHealth > 0 && room != TitleScreen) {
	global.playerHealth -= delta_time/1000000;
} else if (global.playerHealth <= 0 && room != TitleScreen) {
	global.playerHealth = 0;
	obj_player.state = PlayerStateDead;
}
playerHealth = ceil(global.playerHealth);