/// @description Insert description here
// You can write your code in this editor
randomize();

global.gamePaused = false;
global.textSpeed = .75;
global.font_main = font_add_sprite(font_test, 32, true, 1);
global.playerHealthMax = 300.0;
global.playerHealth = global.playerHealthMax;
playerHealth = global.playerHealth;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;
global.questStatus = ds_map_create();
global.questStatus[? "Archer"] = 0;

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(ROOM_START);