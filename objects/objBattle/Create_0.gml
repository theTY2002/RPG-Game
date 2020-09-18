/// @description Insert description here
// You can write your code in this editor

event_inherited();

global.gamePaused = true;

uWhiteFlash = shader_get_uniform(shWhiteFlash, "flash");

enum BATTLE
{
	ATTACK,
	DEFEND,
	MAGIC,
	ITEM,
	RUN
}

playerMaxHP = GetPlayerStat("MAX HP");
playerHP = GetPlayerStat("HP");
playerMaxMP = GetPlayerStat("MAX MP");
playerMP = GetPlayerStat("MP");

isAsleep = false;
stunned = 0;

enemyType = global.enemyType;
enemyHP = GetEnemyStat(enemyType, "HP");

//CHANGE TO IMAGE BLEND
enemySprite = sprSlimeBlank;
enemyColour = GetEnemyStat(enemyType, "COLOUR");
enemyName = GetEnemyStat(enemyType, "NAME");
enemyMoveArray = GetEnemyStat(enemyType, "MOVES");

playerDead = false;
playerDamageMod = 1;
runsAway = false;
battle = true;
victory = false;


selectedOption = 0;
playerTurn = true;
//message = "";
ds_messages = ds_list_create();
messageTimer = 0;
//maxMessageTimer = 60;

showMagicOptions = false;
magicOption = 0;

inventoryEmpty = true;
showInventoryOptions = false;
inventoryOption = 0;

alpha = 0;

hitTime = -1;

playerAccuracy = 0.75;
playerRunChance = 0.6;
enemyAccuracy = 0.5;


//String responses
recoverFromStatus[STATUS.ATTACK] = "";
recoverFromStatus[STATUS.SLEEP] = "PLAYER wakes up!";
recoverFromStatus[STATUS.STUN] = "PLAYER is no longer stunned!";
