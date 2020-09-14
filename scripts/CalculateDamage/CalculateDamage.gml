///@desc CalculateDamage(attacker)
///@arg attacker
function CalculateDamage(argument0) {
	if (argument0 == "PLAYER")
	{
		damage = max(1, GetPlayerStat("ATTACK") - GetEnemyStat(enemyType, "DEFENSE"));
	}
	else
	{
		damage = max(1, GetEnemyStat(enemyType, "ATTACK") - GetPlayerStat("DEFENSE"));
		damage = max (1, floor(damage * playerDamageMod));
	}

	return damage;


}
