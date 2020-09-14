///@arg activateKey
///@arg selectedOption
function SelectOption() {


	if (keyboard_check_pressed(vk_space)) && (messageTimer <= 0)
	{
		switch (selectedOption)
		{
			case BATTLE.ATTACK:
				ds_messages[| 0] = "Player ATTACKS!";
				roll = choose("HIT", "MISS");
			
				if (RandomChance(0.2))
				{
					ds_messages[| 1] = "But misses...";
				}
				else
				{
					var damage = CalculateDamage("PLAYER");
					ds_messages[| 1] = "And hits for " + string(damage) + " damage!";
					enemyHP-= damage;
				}
				break;
			case BATTLE.DEFEND:
				//message = "DEFEND";
				ds_messages[| 0] = "Player DEFENDS!";
				break;
			case BATTLE.MAGIC:
				//message = "MAGIC";
				ds_messages[| 0] = "Player casts MAGIC!";
				break;
			case BATTLE.ITEM:
				//message = "ITEM";
				ds_messages[| 0] = "Player uses an ITEM!";
				break;
			case BATTLE.RUN:
				//message = "RUN";
				ds_messages[| 0] = "Player starts running...";
				if (RandomChance(0.5))
				{
					ds_messages[| 1] = "But trips and falls!";
				}
				else
				{
					ds_messages[| 1] = "And runs away!";
				}
				break;
		}
	}


}
