function BattleTransition() {
	global.gamePaused = true;
	
	if (global.iLifted != noone)
	{
		instance_destroy(global.iLifted);
		global.iLifted = noone;
	}

	/*
	switch(id.object_index)
	{
		case objSlimeGreen:
			type = "GREEN SLIME";
			break;
		case objSlimeBlue:
			type = "BLUE SLIME";
			break;
		default:
			type = "";
			break;
	}
	*/
	

	global.enemyType = id.object_index;

	RoomTransition(TRANS_TYPE.FADE, rmBattle);

	global.enemiesDefeated[array_length(global.enemiesDefeated)] = id;
	//global.currEnemy = id;
}
