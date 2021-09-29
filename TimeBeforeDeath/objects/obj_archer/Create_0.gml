/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

alarm[0] = -1;
enemyDamageTouch = 0;
enemyForceTouch = 0;
state = ENEMYSTATE.WAIT;
sprDie = spr_archer_die;

enemyScript[ENEMYSTATE.WANDER] = EnemyWander;
enemyScript[ENEMYSTATE.ATTACK] = EnemyAttack;
enemyScript[ENEMYSTATE.HURT] = EnemyHurt;
enemyScript[ENEMYSTATE.DIE] = BossDie;
enemyScript[ENEMYSTATE.WAIT] = -1;