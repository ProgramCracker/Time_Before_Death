// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
 function HurtPlayer(_direction, _force, _damage){
	if (obj_player.invulnerable <= 0) {
		global.playerHealth = max(0, global.playerHealth - _damage);
		if (global.playerHealth > 0) {
			with (obj_player) {
				state = PlayerStateShake;
				direction = _direction-180;
				moveDistanceRemaining = _force;
				invulnerable = 60;
			}
		} else {
			// die
			with (obj_player) {
				state = PlayerStateDead;
			}
		}
	}
}