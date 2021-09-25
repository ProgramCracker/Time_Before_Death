/// @description Insert description here
// You can write your code in this editor
randomize();

global.gamePaused = false;
global.textSpeed = 0.75;
global.questStatus = ds_map_create();
global.playerHealthMax = 300.0;
global.playerHealth = global.playerHealthMax;

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(ROOM_START);