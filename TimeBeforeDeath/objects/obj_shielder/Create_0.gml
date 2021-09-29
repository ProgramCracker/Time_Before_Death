/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WAIT;

sprMove = spr_shielder_walk;
sprDie = spr_shielder_die;

enemyScript[ENEMYSTATE.ATTACK] = EnemyAttack;
enemyScript[ENEMYSTATE.CHASE] = EnemyChase;
enemyScript[ENEMYSTATE.HURT] = EnemyHurt;
enemyScript[ENEMYSTATE.DIE] = BossDie;
enemyScript[ENEMYSTATE.WAIT] = -1;