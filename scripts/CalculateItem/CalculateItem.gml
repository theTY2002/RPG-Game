///@desc CalculateItem(item)
///@arg item
function CalculateItem(argument0) {

	switch(argument0)
	{
		case objMushroomRedS:
			value = 2;
			break;
		case objBushBerryRed:
		case objBushBerryBlue:
			value = 3;
			break;
		default:
			value = -1;
	}


	//value = irandom_range(global.spells[argument0, SPELL_STATS.MINVALUE], global.spells[argument0, SPELL_STATS.MAXVALUE]);

	return value;


}
