///@desc GetEnemyStat(enemyType, stat)
///@arg enemyType
///@arg stat
function GetEnemyStat(argument0, argument1) {
	type = -1;

	switch(argument0)
	{
		case objSlimeGreen:
			type = ENEMY_TYPES.SLIMEGREEN;
			break;
		case objSlimeBlue:
			type = ENEMY_TYPES.SLIMEBLUE;
			break;
		case objSlimeYellow:
			type = ENEMY_TYPES.SLIMEYELLOW;
	}

	switch(argument1)
	{
		case "NAME":
			return global.enemyStats[type, ENEMY_STATS.NAME];
			break;
		//case "SPRITE":
			//return sprSlimeBlank;
			//break;
		case "COLOUR":
			return global.enemyStats[type, ENEMY_STATS.COLOUR];
			break;
		case "HP":
			return global.enemyStats[type, ENEMY_STATS.HP];
			break;
		case "ATTACK":
			return global.enemyStats[type, ENEMY_STATS.ATTACK];
			break;
		case "DEFENSE":
			return global.enemyStats[type, ENEMY_STATS.DEFENSE];
			break;
		case "XP":
			return global.enemyStats[type, ENEMY_STATS.XP];
			break;
		case "GOLD":
			return global.enemyStats[type, ENEMY_STATS.GOLD];
			break;
		case "MOVES":
			return global.enemyStats[type, ENEMY_STATS.MOVES];
			break;
	}
}
