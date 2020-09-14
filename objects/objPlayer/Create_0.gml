/// @description Init variables
// You can write your code in this editor
event_inherited();

state = PlayerStateFree;
stateAttack = AttackSlash;
hitByAttack = -1;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Collision"));

image_speed = 0;
xSpeed = 0;
ySpeed = 0;
speedWalk = 2.0;
speedRoll = 3.0;
distanceRoll = 52;
distanceBonk = 30;
distanceBonkHeight = 12;
speedBonk = 1.5;
z = 0;

animationEndScript = -1;

spriteIdle = sprPlayer;
spriteRun = sprPlayerRun;
spriteRoll = sprPlayerRoll;
localFrame = 0;

if (global.iLifted != noone)
{
	spriteIdle = sprPlayerCarry;
	spriteRun = sprPlayerRunCarry;
}
else
{
	spriteIdle = sprPlayer;
	spriteRun = sprPlayerRun;
}

if (global.targetX != -1)
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}

global.iFrame = 240;