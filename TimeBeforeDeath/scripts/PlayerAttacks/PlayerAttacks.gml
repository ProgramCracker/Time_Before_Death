// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
 function AttackSlash(){ 
// spr_pl3 = attack sprite

// start the attack animation
if (sprite_index != spr_player_attack) {
		sprite_index = spr_player_attack;
		localFrame = 0;
		
// image index check
		image_index = 0;
		
// create list of enemies that are hit by the attack
		if (!ds_exists(hitByAttack, ds_type_list)) {
			hitByAttack = ds_list_create()
		}
// clears list
		ds_list_clear(hitByAttack);
	}
	
// function that gives damage to enemies
	CalcAttack(spr_player_attack_col);
	
	PlayerAnimateSprite();
	
	if (animationEnd) {
		state = PlayerStateFree;
		animationEnd = false;
	}
} 

function CalcAttack(argument0){
mask_index = argument0;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, p_entity, hitByAttackNow, false);
	
	if (hits > 0) {
		for (var i = 0; i < hits; i++) {
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1) {
				ds_list_add(hitByAttack, hitID);
				with (hitID) {
					if (object_is_ancestor(object_index, p_enemy)) {
						HurtEnemy(id, 5, other.id, 10);
					}
					if (entityHitScript != -1) {
						script_execute(entityHitScript);
					}
				}
			}
		}
	}
	
	ds_list_destroy(hitByAttackNow);
	mask_index = spr_player; // or whatever the idle sprite is
}

function HurtEnemy(_enemy, _damage, _source, _knockback) {
	with (_enemy) {
		if (state != ENEMYSTATE.DIE) {
			enemyHP -= _damage;
			flash = 1;
			
			if (enemyHP <= 0) {
				state = ENEMYSTATE.DIE;
			} else {
				if (state != ENEMYSTATE.HURT) {
					statePrevious = state;
				}
				state = ENEMYSTATE.HURT;
			}
			image_index = 0;
			if (_knockback != 0) {
				var _knockDirection = point_direction(x, y, (_source).x, (_source).y);
				xTo = x - lengthdir_x(_knockback, _knockDirection);
				yTo = y - lengthdir_y(_knockback, _knockDirection);
			}
		}
	}
} 