/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemyDamageTouch = 0;
enemyForceTouch = 0;
state = ENEMYSTATE.WAIT;
sprDie = spr_archer_die;

enemyScript[ENEMYSTATE.ATTACK] = RangeAttack;
enemyScript[ENEMYSTATE.HURT] = EnemyHurt;
enemyScript[ENEMYSTATE.DIE] = BossDie;
enemyScript[ENEMYSTATE.WAIT] = -1;