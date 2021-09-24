// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateFree(){
	hsp = lengthdir_x(inputMagnitude * walkspd, inputDirection);
vsp = lengthdir_y(inputMagnitude * walkspd, inputDirection);

PlayerCollision();

// update sprite index
var _oldSprite = sprite_index;
if (inputMagnitude != 0) {
	direction = inputDirection;
	sprite_index = spriteRun;
} else {
	sprite_index = spriteIdle;
}
if (_oldSprite != sprite_index) {
	localFrame = 0;
}

// update image index
PlayerAnimateSprite();

// do it for each attack key
if (obj_player.key_attack) {
	state = PlayerStateAttack;
	stateAttack = AttackSlash;
}

if (obj_player.key_int) {
	var _activateX = lengthdir_x(10, direction);
	var _activateY = lengthdir_y(10, direction);
	activate = instance_position(x + _activateX, y + _activateY, p_entity);
	
	if (activate == noone || activate.entityActivateScript == -1) {
		// do nothing
	} else {
		ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
	}
	}
}