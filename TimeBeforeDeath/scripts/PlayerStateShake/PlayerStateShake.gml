// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
 function PlayerStateShake(){
	hsp = lengthdir_x(speedShake, direction - 180);
	vsp = lengthdir_y(speedShake, direction - 180);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedShake);
	var _collided = PlayerCollision();
	
	/// sprite_index = spr_player_hurt; just flash
	image_index = CARDINAL_DIR - 2;
	
	//change height
	z = sin(((moveDistanceRemaining / distanceShake) * pi)) * distanceShakeHeight;
	
	if (moveDistanceRemaining <= 0) {
		state = PlayerStateFree;
	}
}