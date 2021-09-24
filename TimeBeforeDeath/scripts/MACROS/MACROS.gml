// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MACROS(){
	#macro FRAME_RATE 60
	#macro TILE_SIZE 8
	#macro CARDINAL_DIR round(direction/90)
	#macro ROOM_START Room1
	#macro RESOLUTION_W 320
	#macro RESOLUTION_H 180

	enum ENEMYSTATE {
		IDLE,
		WANDER,
		CHASE,
		ATTACK,
		HURT,
		DIE,
		WAIT
	}
}