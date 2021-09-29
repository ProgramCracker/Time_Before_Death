// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RangeAttack(){
	// where to point gun, essentially
	var _dir = point_direction(x, y, obj_player.x, obj_player.y);
	
	// shooting time
	with (instance_create_depth(x, y, depth, obj_arrow)) {
		direction = _dir;
		speed = 6;
		image_angle = direction;
	}
	
}

function MageAttack() {
	// where to point gun, essentially
	var _dir = point_direction(x, y, obj_player.x, obj_player.y);
	
	// shooting time
	if (floor(image_index == 1)) {
		image_index = 1;
		with (instance_create_depth(x, y, depth, obj_fireball)) {
		direction = _dir;
		speed = 6;
		image_angle = direction;
	}
	}
}

function BossDie() {
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed) {
		dir = point_direction(x, y, xTo, yTo);
		hsp = lengthdir_x(enemySpeed, dir);
		vsp = lengthdir_y(enemySpeed, dir);
		if (hsp != 0) {
			image_xscale = -sign(hsp);
		}
		EnemyTileCollision();
	} else {
		x = xTo;
		y = yTo;
	}
	if (image_index + sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps) >= image_number) {
		instance_destroy();
		global.playerHealth += 30.0;
	}

}