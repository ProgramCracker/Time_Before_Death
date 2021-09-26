/// @description Insert description here
// You can write your code in this editor
// player states for walking and attacking
 state = PlayerStateFree;
 stateAttack = AttackSlash;
 hitByAttack = -1;
 lastState = state;
 
// collision map to see what the player can bump into
 collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
 
// make it so that the player doesn't rotate through animations for each sheet in the idle spritesheet
 image_speed = 0;

// the speeds
 hsp = 0;
 vsp = 0;
 walkspd = 2.0;
 distanceShake = 40;
 distanceShakeHeight = 12;
 speedShake = 1.5;
 z = 0; 
 
 // damage stuff
 invulnerable = 60;
 
// key initialization. D, A, W, S, K(?), L(?)
 key_right = 0;
 key_left = 0;
 key_up = 0;
 key_down = 0;
 key_int = 0;
 key_attack = 0;
 
// sprite initialization for idle and walking
 spriteIdle = spr_player; // replace with actual sprite
 spriteRun = spr_player_walk; // replace with actual sprite
 localFrame = 0;