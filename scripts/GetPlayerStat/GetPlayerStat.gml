///@desc GetPlayerStat(stat)
///@arg stat
function GetPlayerStat(argument0) {

	switch(argument0)
	{
		case "NAME":
			return global.playerStats[PLAYER_STATS.NAME];
			break;
		case "MAX HP":
			return global.playerStats[PLAYER_STATS.HPMAX];
			break;
		case "HP":
			return global.playerStats[PLAYER_STATS.HPCURRENT];
			break;
		case "MAX MP":
			return global.playerStats[PLAYER_STATS.MPMAX];
			break;
		case "MP":
			return global.playerStats[PLAYER_STATS.MPCURRENT];
			break;
		case "ATTACK":
			return global.playerStats[PLAYER_STATS.ATTACK];
			break;
		case "DEFENSE":
			return global.playerStats[PLAYER_STATS.DEFENSE];
			break;
		case "XP":
			return global.playerStats[PLAYER_STATS.XP];
			break;
		case "LEVEL":
			return global.playerStats[PLAYER_STATS.LEVEL];
			break;
		case "GOLD":
			return global.playerStats[PLAYER_STATS.GOLD];
			break;
	}


}
