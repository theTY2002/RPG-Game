/// @description Initialise & Globals
// You can write your code in this editor

testScale = 32/100;

/*
yee = false;
show_debug_message(string(yee));
script46(yee);
show_debug_message(string(yee));
*/

randomize();
window_set_cursor(cr_none);
cursor_sprite = sprCursor;

global.gameStart = false;
global.gamePaused = false;
global.gameOver = false;
global.musicPaused = false;
global.textSpeed = 0.75;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;
global.iLifted = noone;

global.iCamera = instance_create_layer(0, 0, layer, objCamera);

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);

//Map
global.minimap[0][0] = 0;
global.locationX = 0;
global.locationY = 0;

//Coins
global.coinNum = 0;

//UI Text
global.floatTextString = "";
global.floatTextColour = c_black;

//Mouse
global.mouseX = device_mouse_x_to_gui(0);
global.mouseY = device_mouse_y_to_gui(0);

global.currentRoom = rmInit;

global.battle = false;

global.iFrame = -1;

global.giveHat = false;
global.hatQuest = false;

#region Player
//Player Stats
enum PLAYER_STATS
{
	NAME,
	HPMAX,
	HPCURRENT,
	MPMAX,
	MPCURRENT,
	ATTACK,
	DEFENSE,
	XP,
	LEVEL,
	GOLD
}

global.playerStats[PLAYER_STATS.NAME] = "YEEEE";
global.playerStats[PLAYER_STATS.HPMAX] = 10;
global.playerStats[PLAYER_STATS.HPCURRENT] = 10;
global.playerStats[PLAYER_STATS.MPMAX] = 10;
global.playerStats[PLAYER_STATS.MPCURRENT] = 10;
global.playerStats[PLAYER_STATS.ATTACK] = 1;
global.playerStats[PLAYER_STATS.DEFENSE] = 1;
global.playerStats[PLAYER_STATS.XP] = 0;
global.playerStats[PLAYER_STATS.LEVEL] = 1;
global.playerStats[PLAYER_STATS.GOLD] = 0;

#endregion

#region Spells
//Spells
enum SPELL
{
	HEAL,
	MAGICDART,
	MAGICBALL,
	//EXITDUNGEON,
	//RETURNTOLASTINN,
	LAST
}


//Spell Stats
enum SPELL_STATS
{
	NAME,
	MINVALUE,
	MAXVALUE,
	MPCOST,
	KNOWN,
	LEVELTOLEARN
}

global.spells[SPELL.HEAL][SPELL_STATS.NAME] = "HEAL";
global.spells[SPELL.HEAL][SPELL_STATS.MINVALUE] = 5 + global.playerStats[PLAYER_STATS.LEVEL];
global.spells[SPELL.HEAL][SPELL_STATS.MAXVALUE] = 7 + global.playerStats[PLAYER_STATS.LEVEL];
global.spells[SPELL.HEAL][SPELL_STATS.MPCOST] = 4;
global.spells[SPELL.HEAL][SPELL_STATS.KNOWN] = false;
global.spells[SPELL.HEAL][SPELL_STATS.LEVELTOLEARN] = 3;

global.spells[SPELL.MAGICDART][SPELL_STATS.NAME] = "MAGIC DART";
global.spells[SPELL.MAGICDART][SPELL_STATS.MINVALUE] = 1 + global.playerStats[PLAYER_STATS.LEVEL];
global.spells[SPELL.MAGICDART][SPELL_STATS.MAXVALUE] = 2 + global.playerStats[PLAYER_STATS.LEVEL];
global.spells[SPELL.MAGICDART][SPELL_STATS.MPCOST] = 2;
global.spells[SPELL.MAGICDART][SPELL_STATS.KNOWN] = false;
global.spells[SPELL.MAGICDART][SPELL_STATS.LEVELTOLEARN] = 4;

global.spells[SPELL.MAGICBALL][SPELL_STATS.NAME] = "MAGIC BALL";
global.spells[SPELL.MAGICBALL][SPELL_STATS.MINVALUE] = 5 + global.playerStats[PLAYER_STATS.LEVEL];
global.spells[SPELL.MAGICBALL][SPELL_STATS.MAXVALUE] = 7 + global.playerStats[PLAYER_STATS.LEVEL];
global.spells[SPELL.MAGICBALL][SPELL_STATS.MPCOST] = 5;
global.spells[SPELL.MAGICBALL][SPELL_STATS.KNOWN] = false;
global.spells[SPELL.MAGICBALL][SPELL_STATS.LEVELTOLEARN] = 6;

/*
global.spells[SPELL.EXITDUNGEON][SPELL_STATS.NAME] = "EXIT";
global.spells[SPELL.EXITDUNGEON][SPELL_STATS.MINVALUE] = -1;
global.spells[SPELL.EXITDUNGEON][SPELL_STATS.MAXVALUE] = -1;
global.spells[SPELL.EXITDUNGEON][SPELL_STATS.MPCOST] = 4;
global.spells[SPELL.EXITDUNGEON][SPELL_STATS.KNOWN] = false;
global.spells[SPELL.EXITDUNGEON][SPELL_STATS.LEVELTOLEARN] = 4;

global.spells[SPELL.RETURNTOLASTINN][SPELL_STATS.NAME] = "RETURN";
global.spells[SPELL.RETURNTOLASTINN][SPELL_STATS.MINVALUE] = -1;
global.spells[SPELL.RETURNTOLASTINN][SPELL_STATS.MAXVALUE] = -1;
global.spells[SPELL.RETURNTOLASTINN][SPELL_STATS.MPCOST] = 4;
global.spells[SPELL.RETURNTOLASTINN][SPELL_STATS.KNOWN] = false;
global.spells[SPELL.RETURNTOLASTINN][SPELL_STATS.LEVELTOLEARN] = 5;
*/

#endregion

#region Enemies
enum ENEMY_TYPES
{
	SLIMEGREEN,
	SLIMEBLUE,
	SLIMEYELLOW,
	DEMONKING
}

enum ENEMY_STATS
{
	NAME,
	//SPRITE,
	COLOUR,
	HP,
	ATTACK,
	DEFENSE,
	XP,
	GOLD,
	MOVES
}

global.enemyStats[ENEMY_TYPES.SLIMEGREEN][ENEMY_STATS.NAME] = "GREEN SLIME";
//global.enemyStats[ENEMY_TYPES.SLIMEGREEN][ENEMY_STATS.SPRITE] = sprSlime;
global.enemyStats[ENEMY_TYPES.SLIMEGREEN][ENEMY_STATS.COLOUR] = SLIMEGREENCOLOUR;
global.enemyStats[ENEMY_TYPES.SLIMEGREEN][ENEMY_STATS.HP] = 3;
global.enemyStats[ENEMY_TYPES.SLIMEGREEN][ENEMY_STATS.ATTACK] = 2;
global.enemyStats[ENEMY_TYPES.SLIMEGREEN][ENEMY_STATS.DEFENSE] = 0;
global.enemyStats[ENEMY_TYPES.SLIMEGREEN][ENEMY_STATS.XP] = 1;
global.enemyStats[ENEMY_TYPES.SLIMEGREEN][ENEMY_STATS.GOLD] = 1;

global.enemyStats[ENEMY_TYPES.SLIMEBLUE][ENEMY_STATS.NAME] = "BLUE SLIME";
//global.enemyStats[ENEMY_TYPES.SLIMEBLUE][ENEMY_STATS.SPRITE] = sprSlimeBlue;
global.enemyStats[ENEMY_TYPES.SLIMEBLUE][ENEMY_STATS.COLOUR] = SLIMEBLUECOLOUR;//make_color_rgb(132, 189, 240);//objSlimeBlue.slimeColour;
global.enemyStats[ENEMY_TYPES.SLIMEBLUE][ENEMY_STATS.HP] = 5;
global.enemyStats[ENEMY_TYPES.SLIMEBLUE][ENEMY_STATS.ATTACK] = 3;
global.enemyStats[ENEMY_TYPES.SLIMEBLUE][ENEMY_STATS.DEFENSE] = 1;
global.enemyStats[ENEMY_TYPES.SLIMEBLUE][ENEMY_STATS.XP] = 2;
global.enemyStats[ENEMY_TYPES.SLIMEBLUE][ENEMY_STATS.GOLD] = 2;

global.enemyStats[ENEMY_TYPES.SLIMEYELLOW][ENEMY_STATS.NAME] = "YELLOW SLIME";
global.enemyStats[ENEMY_TYPES.SLIMEYELLOW][ENEMY_STATS.COLOUR] = SLIMEYELLOWCOLOUR;
global.enemyStats[ENEMY_TYPES.SLIMEYELLOW][ENEMY_STATS.HP] = 5;
global.enemyStats[ENEMY_TYPES.SLIMEYELLOW][ENEMY_STATS.ATTACK] = 3;
global.enemyStats[ENEMY_TYPES.SLIMEYELLOW][ENEMY_STATS.DEFENSE] = 1;
global.enemyStats[ENEMY_TYPES.SLIMEYELLOW][ENEMY_STATS.XP] = 2;
global.enemyStats[ENEMY_TYPES.SLIMEYELLOW][ENEMY_STATS.GOLD] = 2;

global.enemyStats[ENEMY_TYPES.DEMONKING][ENEMY_STATS.NAME] = "DEMON KING";
//global.enemyStats[ENEMY_TYPES.DEMONKING][ENEMY_STATS.SPRITE] = -1;
global.enemyStats[ENEMY_TYPES.DEMONKING][ENEMY_STATS.HP] = -1;
global.enemyStats[ENEMY_TYPES.DEMONKING][ENEMY_STATS.ATTACK] = -1;
global.enemyStats[ENEMY_TYPES.DEMONKING][ENEMY_STATS.DEFENSE] = -1;
global.enemyStats[ENEMY_TYPES.DEMONKING][ENEMY_STATS.XP] = -1;
global.enemyStats[ENEMY_TYPES.DEMONKING][ENEMY_STATS.GOLD] = -1;

global.enemyStats[ENEMY_TYPES.SLIMEGREEN][ENEMY_STATS.MOVES] = ["ATTACK"];
global.enemyStats[ENEMY_TYPES.SLIMEBLUE][ENEMY_STATS.MOVES] = ["ATTACK", "SLEEP"];
global.enemyStats[ENEMY_TYPES.SLIMEYELLOW][ENEMY_STATS.MOVES] = ["ATTACK", "STUN"];

#endregion

#region Battle
global.enemiesDefeated[0] = -1;

enum OPTIONS
{
	ATTACK,
	DEFEND,
	MAGIC,
	ITEM,
	RUN,
	LAST
}

global.optionText[OPTIONS.ATTACK] = "ATTACK";
global.optionText[OPTIONS.DEFEND] = "DEFEND";
global.optionText[OPTIONS.MAGIC] = "MAGIC";
global.optionText[OPTIONS.ITEM] = "ITEM";
global.optionText[OPTIONS.RUN] = "RUN";

enum STATUS
{
	ATTACK,
	SLEEP,
	STUN
}

global.statuses[STATUS.ATTACK] = "ATTACK";
global.statuses[STATUS.SLEEP] = "SLEEP";
global.statuses[STATUS.STUN] = "STUN";

//global.spawn = ENEMY_TYPES.SLIMEGREEN;
global.enemyType = noone;


enum ITEMTEXT
{
	REDMUSHROOMSMALL,
	REDBERRY,
	BLUEBERRY
}

global.itemText[ITEMTEXT.REDMUSHROOMSMALL] = "Small Red Mushroom" + "\n" + "Heals for a small amount of HP."
global.itemText[ITEMTEXT.REDBERRY] = "Bright Red Berries" + "\n" + "Slightly healthy."
global.itemText[ITEMTEXT.BLUEBERRY] = "Bright Blue Berries." + "\n" + "Slightly magical."

#endregion



with (all)
{
	gamePausedImageSpeed = image_speed;
}

room_goto(ROOM_START);