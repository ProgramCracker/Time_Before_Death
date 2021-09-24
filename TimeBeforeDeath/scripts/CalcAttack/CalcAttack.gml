// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CalcAttack(){
mask_index = argument0;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, p_entity, hitByAttackNow, false);
	
	if (hits > 0) {
		for (var i = 0; i < hits; i++) {
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1) {
				ds_list_add(hitByAttack, hitID);
				with (hitID) {
					if (entityHitScript != -1) {
						script_execute(entityHitScript);
					}
				}
			}
		}
	}
	
	ds_list_destroy(hitByAttackNow);
	mask_index = spr_pl1; // or whatever the idle sprite is
}