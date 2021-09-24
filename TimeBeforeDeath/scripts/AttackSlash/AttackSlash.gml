// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackSlash(){
// spr_pl3 = attack sprite

// start the attack animation
if (sprite_index != spr_pl3) {
		sprite_index = spr_pl3;
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
	CalcAttack(spr_colattack);
	
	PlayerAnimateSprite();
	
	if (animationEnd) {
		state = PlayerStateFree;
		animationEnd = false;
	}
}