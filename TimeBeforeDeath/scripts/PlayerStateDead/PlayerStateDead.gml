// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateDead(){
	hsp = 0;
	vsp = 0;
	
	// death cutscene time?
	// if just arriving in this state
	image_index = 0;
	sprite_index = spr_player_dead;
	image_speed = 1.0;
	
	image_speed = 0;
	image_index = image_number-1;
		
}