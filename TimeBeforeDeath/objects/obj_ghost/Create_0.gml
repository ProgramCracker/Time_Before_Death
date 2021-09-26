/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

sprMove = spr_ghost;
sprAttack = spr_ghostAttack;
sprHurt = spr_ghostHurt;
sprDie = spr_ghostDie;

enemyScript[ENEMYSTATE.WANDER] = GhostWander;
enemyScript[ENEMYSTATE.CHASE] = GhostChase;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HURT] = EnemyHurt;
enemyScript[ENEMYSTATE.DIE] = EnemyDie;