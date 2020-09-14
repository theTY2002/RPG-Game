// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UseItem(item)
{
	itemVal = CalculateItem(item);
	
	
	
	if (item.itemHPHeal)
	{
		if (playerHP + itemVal <= playerMaxHP)
		{
			playerHP += itemVal;
		}
		else
		{
			playerHP = playerMaxHP;
		}
		ds_messages[| 0] = "Player uses " + ConvertObjectName(item) + "!";
		ds_messages[| 1] = "and is healed for " + string(itemVal) + " HP!";
		ItemChangeNumber(item, -1);
	}
	
	if (item.itemMPHeal)
	{
		with (objStatBar)
		{
			takeMana = false;
		}
		
		if (playerMP + itemVal <= playerMaxMP)
		{
			playerMP += itemVal;
		}
		else
		{
			playerMP = playerMaxMP;
		}
		ds_messages[| 0] = "Player uses " + ConvertObjectName(item) + "!";
		ds_messages[| 1] = "and restores " + string(itemVal) + " MP!";
		ItemChangeNumber(item, -1);
	}
	
	/*
	switch (item)
	{
		//Could check for item type in the future
		case objMushroomRedS:
		case objBushBerryRed:
			if (playerHP + itemVal <= playerMaxHP)
			{
				playerHP += itemVal;
			}
			else
			{
				playerHP = playerMaxHP;
			}
			ds_messages[| 0] = "Player uses " + ConvertObjectName(currItem) + "!";
			ds_messages[| 1] = "and is healed for " + string(itemVal) + " HP!";
			ItemChangeNumber(currItem, -1);
			break;
		case objBushBerryBlue:
			if (playerMP + itemVal <= playerMaxMP)
			{
				playerMP += itemVal;
			}
			else
			{
				playerMP = playerMaxMP;
			}
			ds_messages[| 0] = "Player uses " + ConvertObjectName(currItem) + "!";
			ds_messages[| 1] = "and restores " + string(itemVal) + " MP!";
			ItemChangeNumber(currItem, -1);
			break;
	}
	global.playerStats[PLAYER_STATS.HPMAX] = playerMaxHP;
	global.playerStats[PLAYER_STATS.HPCURRENT] = playerHP;
	global.playerStats[PLAYER_STATS.MPMAX] = playerMaxMP;
	global.playerStats[PLAYER_STATS.MPCURRENT] = playerMP;
	*/
}