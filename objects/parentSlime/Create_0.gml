/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

x = xstart;
y = ystart;


state = ENEMYSTATE.WANDER;

//Enemy Sprites
sprMove = sprSlimeBlank;
sprAttack = sprSlimeBlankAttack;
sprWait = sprSlimeBlank;

slimeColour = c_white;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack;

mask_index = sprSlimeBlank;