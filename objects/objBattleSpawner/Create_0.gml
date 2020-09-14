/// @description Insert description here
// You can write your code in this editor

state = "NO BATTLE";

spawnTimer = 0;

minSpawnTime = 60;
maxSpawnTime = 120;

timeTillBattle = irandom_range(minSpawnTime, maxSpawnTime);

ds_magic_list = ds_list_create();

playerTurn = false;
selectedOption = OPTIONS.ATTACK;
maxOptions = OPTIONS.LAST;
	
optionState = "MAIN"; //Main or Attack or Item or Run or Battle Over
victoryState = "INIT"; //Init or Player Won or Monster Won or Player Ran
	
state = "READY";
textToDisplay = "";
visibleString = "";
	
monsterTimer = 0;
timeTillMonsterActs = 30;

hero = noone;