// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyWander(){
	sprite_index = sprMove;

	if ((x == xTo) && (y == yTo) || timePassed > enemyWanderDistance / enemySpeed) {
		hsp = 0;
		vsp = 0;
		
		//end move animation
		if (image_index < 1) {
			image_speed = 0.0;
			image_index = 0;
		}
		if (++wait >= waitDuration) {
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	} else {
		timePassed++;
		image_speed = 1.0;
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
	
function EnemyChase(){
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
	
	// check if close enough to launch an attack
	if (instance_exists(target) && point_distance(x, y, target.x, target.y) <= enemyAttackRadius) {
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0;
		// target 8px past the player
		xTo += lengthdir_x(8, dir);
		yTo += lengthdir_y(8, dir);
	}
}
	
function EnemyAttack(){
	// how fast to move
	var _spd = enemySpeed;
	
	// don't move while doing a telegraph for move
	if (image_index < 1 /* or whatever it'll be */) {
		_spd = 0;
	}
	
	// Freeze animation when finishes
	if (floor(image_index) == 3) {
		image_speed = 0;
	}
	
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	if (image_index < 3) {
		image_speed = 1.0;
	}
	
	// move
	if (_distanceToGo > _spd) {
		dir = point_direction(x, y, xTo, yTo);
		hsp = lengthdir_x(_spd, dir);
		vsp = lengthdir_y(_spd, dir);
		if (hsp != 0) {
			image_xscale = sign(hsp);
		}
		
		// commit to move and stop moving if hit a wall
		if (EnemyTileCollision() == true) {
			xTo = x;
			yTo = y;
		}
	} else {
		x = xTo;
		y = yTo;
		if (floor(image_index) == 3) {
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
}
	
function EnemyHurt() {
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed) {
		image_speed = 1.0;
		dir = point_distance(x, y, xTo, yTo);
		hsp = lengthdir_x(enemySpeed, dir);
		vsp = lengthdir_y(enemySpeed, dir);
		if (hsp != 0) {
			image_xscale = -sign(hsp);
		}
		
		// collide and move from knockback, if collision, then stop knockback movement
		if (EnemyTileCollision()) {
			xTo = x;
			yTo = y;
		}
	} else {
		x = xTo;
		y = yTo;
		if (statePrevious != ENEMYSTATE.ATTACK) {
			state = statePrevious;
		} else {
			state = ENEMYSTATE.CHASE;
		}
	}
}

function EnemyDie() {
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
	
	if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number) {
		instance_destroy();
		global.playerHealth += 5.0;
	}
}