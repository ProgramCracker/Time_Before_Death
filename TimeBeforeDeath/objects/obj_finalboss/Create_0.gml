/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemyDamageTouch = 0;
enemyForceTouch = 0;
state = ENEMYSTATE.WAIT;

sprMove = spr_final_walk;

enemyScript[ENEMYSTATE.ATTACK] = EnemyAttack;
enemyScript[ENEMYSTATE.CHASE] = EnemyChase;
enemyScript[ENEMYSTATE.HURT] = EnemyHurt;
enemyScript[ENEMYSTATE.DIE] = EnemyDie;
enemyScript[ENEMYSTATE.WAIT] = -1;