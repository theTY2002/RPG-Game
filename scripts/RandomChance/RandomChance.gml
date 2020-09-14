///@desc RandomChance(chance)
///@arg chance
function RandomChance(chance) {

	roll = irandom(99) + 1;

	if (roll < 100 * chance)
	{
		return true;
	}
	else
	{
		return false;
	}
}
