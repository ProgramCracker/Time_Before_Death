// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GhostChase() {
	sprite_index = sprMove;
	
	if (instance_exists(target)) {
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed) {
			hsp = lengthdir_x(enemySpeed, dir);
			vsp = lengthdir_y(enemySpeed, dir);
		} else {
			hsp = lengthdir_x(_distanceToGo, dir);
			vsp = lengthdir_y(_distanceToGo, dir);
		}
		if (hsp != 0) {
			image_xscale = sign(hsp);
		}
		EnemyTileCollision();
	}
}

function GhostWander() {
	sprite_index = sprMove;
	image_speed = 1.0;

	if ((x == xTo) && (y == yTo) || timePassed > enemyWanderDistance / enemySpeed) {
		hsp = 0;
		vsp = 0;
		
		if (++wait >= waitDuration) {
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	} else {
		timePassed++;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed) {
			_speedThisFrame = _distanceToGo;
		}
		dir = point_direction(x, y, xTo, yTo);
		hsp = lengthdir_x(_speedThisFrame, dir);
		vsp = lengthdir_y(_speedThisFrame, dir);
		if (hsp != 0) {
			image_xscale = sign(hsp);
		}
		EnemyTileCollision();
	}
	
	if (++aggroCheck >= aggroCheckDuration) {
		aggroCheck = 0;
		if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) <= enemyAggroRadius) {
			state = ENEMYSTATE.CHASE;
			target = obj_player;
		}
	}
}