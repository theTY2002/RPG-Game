/// @description Insert description here
// You can write your code in this editor
event_inherited();

for (var i = 0; i < array_length(global.enemiesDefeated); i++)
{
	if (id = global.enemiesDefeated[i])
	{
		instance_destroy();
	}
}

//Intrinsic variables
state = ENEMYSTATE.IDLE;
xSpeed = 0;
ySpeed = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
timePassed = 0;
waitDuration = 60;
wait = 0;

aggroCheck = 0;
aggroCheckDuration = 5;
stateTarget = state;
statePrevious = state; 
stateWait = 0;
stateWaitDuration = 0;

show_debug_message("CREATE");

//Enemy Sprites
sprMove = sprSlime;

//Enemy Scripts
enemyScript[ENEMYSTATE.IDLE] = -1;
enemyScript[ENEMYSTATE.WANDER] = -1;
enemyScript[ENEMYSTATE.CHASE] = -1;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HURT] = -1;
enemyScript[ENEMYSTATE.DIE] = -1;
enemyScript[ENEMYSTATE.WAIT] = EnemyWait; 

//enemyMoves[0] = STATUS.ATTACK;