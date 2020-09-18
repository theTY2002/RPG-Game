/// @description Insert description here
// You can write your code in this editor
if (battle == true)
{
	//Player Turn
	if (playerTurn) && (!instance_exists(objText))
	{
		with (objStatBar)
		{
			takeDamage = false;
			takeMana = true;
		}
		
		playerDamageMod = 1;
		CreateDSList(ds_messages);
		messageTimer--;
		
		if (isAsleep)
		{
			isAsleep = choose(true, false);
				
			if (!isAsleep)
			{
				NewTextBox(recoverFromStatus[STATUS.SLEEP], 4);
			}
		}
			
		if (stunned > 0)
		{
			stunned--;
			if (stunned <= 0)
			{
				NewTextBox(recoverFromStatus[STATUS.STUN], 4);
			}
		}
		
		if (!isAsleep) && (stunned <= 0)
		{
			if (messageTimer <= 0)
			{
				#region //Menu controls
				if (!showMagicOptions) && (!showInventoryOptions)
				{
					selectedOption = ArrayControl(vk_down, "S", vk_up, "W", selectedOption, global.optionText);
				}
				else
				{
					if (showMagicOptions)
					{
						magicOption = ArrayControl(vk_down, "S", vk_up, "W", magicOption, global.spells);
					}
				
					if (showInventoryOptions)
					{
						inventoryOption = ArrayControl(vk_down, "S", vk_up, "W", inventoryOption, global.inventory);
					}
				}
				#endregion
			}

			if (!showMagicOptions) && (!showInventoryOptions)
			{
				#region //Player Selects Option
				if (keyboard_check_pressed(vk_space)) && (messageTimer <= 0)
				{
					switch (selectedOption)
					{
						case BATTLE.ATTACK:
							ds_messages[| 0] = "Player ATTACKS!";
			
							if (RandomChance(playerAccuracy))
							{
								var damage = CalculateDamage("PLAYER");
								ds_messages[| 1] = "And hits for " + string(damage) + " damage!";
								enemyHP -= damage;
								hitTime = 10.0;
								PlaySoundEffect(sAttack, true);
							}
							else
							{
								ds_messages[| 1] = "But misses...";
								PlaySoundEffect(sMiss, true);
							}
							break;
						case BATTLE.DEFEND:
							//message = "DEFEND";
							ds_messages[| 0] = "Player DEFENDS!";
							playerDamageMod = 0.5;
							break;
						case BATTLE.MAGIC:
							//message = "MAGIC";
							ds_messages[| 0] = "Player casts MAGIC!";
							break;
						case BATTLE.ITEM:
							//message = "ITEM";
							//ds_messages[| 0] = "Player uses an ITEM!";
							if (ds_map_size(global.inventory) == 0)
							{
								ds_messages[| 0] = "Your inventory is empty!";
								inventoryEmpty = true;
							}
							else
							{
								inventoryEmpty = false;
							}
							break;
						case BATTLE.RUN:
							//message = "RUN";
							ds_messages[| 0] = "Player tries to run...";
							if (RandomChance(playerRunChance))
							{
								runsAway = true;
								ds_messages[| 1] = "And runs away!";
							}
							else
							{
								ds_messages[| 1] = "But trips and falls!";
							}
							break;
					}
				
					if (selectedOption != BATTLE.MAGIC) && (selectedOption != BATTLE.ITEM)
					{
						EndTurn(ds_messages);
					}
					else
					{
						if (selectedOption == BATTLE.MAGIC)
						{
							showMagicOptions = true;
						}
					
						if (selectedOption == BATTLE.ITEM)
						{
							showInventoryOptions = true;
						}
					}
				}
				#endregion
			}
			else
			{
				if (showMagicOptions)
				{
					#region //Select Magic Option
					if (keyboard_check_pressed(vk_space)) && (messageTimer <= 0)
					{
						manaCost = global.spells[magicOption, SPELL_STATS.MPCOST];
			
						if (playerMP >= manaCost)
						{
							magicVal = CalculateMagic(magicOption);
							switch(magicOption)
							{
								case SPELL.HEAL:
									ds_messages[| 0] = "Player casts " + global.spells[magicOption, SPELL_STATS.NAME];
									ds_messages[| 1] = "and heals for " + string(magicVal) + " HP!";
						
									if (playerHP + magicVal <= playerMaxHP)
									{
										playerHP += magicVal;
									}
									else
									{
										playerHP = playerMaxHP;
									}
									PlaySoundEffect(sHeal, false);
									break;
								case SPELL.MAGICDART:
									ds_messages[| 0] = "Player casts " + global.spells[magicOption, SPELL_STATS.NAME];
									ds_messages[| 1] = "and hits for " + string(magicVal) + " damage!";
									PlaySoundEffect(sMagicDart, true);
									enemyHP -= magicVal;
									break;
							}
							playerMP -= manaCost;
						}
						else
						{
							PlaySoundEffect(sMagicFail, true);
							ds_messages[| 0] = "Player tries to cast a spell...";
							ds_messages[| 1] = "but you don't have enough mana!"
						}
				
						EndTurn(ds_messages);
					
						showMagicOptions = false;
					}
					#endregion
				}
			
				if (showInventoryOptions)
				{
					 if (inventoryEmpty)
					 {
						ResetTurn(ds_messages);
			
						showInventoryOptions = false;
					 }
					 else
					 {
						#region //Select Item
						if (keyboard_check_pressed(vk_space)) && (messageTimer <= 0)
						{
							currItem = ds_map_find_first(global.inventory);
							for (var i = 0; i < ds_map_size(global.inventory); i++)
							{
								if (inventoryOption == i)
								{
									UseItem(currItem);
									break;
								}
								currItem = ds_map_find_next(global.inventory, currItem);
							}
							EndTurn(ds_messages);
							showInventoryOptions = false;
						}
						#endregion
					 }
				}
			
				if (showMagicOptions || showInventoryOptions)
				{
					#region //Cancel selection
					if (keyboard_check_pressed(ord("Q")))
					{
						showMagicOptions = false;
						showInventoryOptions = false;
						magicOption = 0;
						inventoryOption = 0;
					}
					#endregion
				}
			}
		}
		else
		{
			if (isAsleep)
			{
				ds_messages[| 0] = "PLAYER is asleep...";
			}
			if (stunned > 0)
			{
				ds_messages[| 0] = "PLAYER is stunned..." + "\n(" + string(stunned) + " turn(s) left)";
			}
			EndTurn(ds_messages);
		}
		
			
	}
	
	if (enemyHP <= 0)
	{
		#region //Player won
		battle = false;
		NewTextBox(enemyName + " dies...", 4);
		NewTextBox("You won!", 4);
		global.playerStats[PLAYER_STATS.XP] += GetEnemyStat(enemyType, "XP");
		global.playerStats[PLAYER_STATS.GOLD] += GetEnemyStat(enemyType, "GOLD");
		NewTextBox("You gained " + string(GetEnemyStat(enemyType, "XP")) + " XP and " + string(GetEnemyStat(enemyType, "GOLD")) + " gold!", 4);
		victory = true;
		#endregion
	}
	
	if (runsAway)
	{
		battle = false;
		NewTextBox("You ran away!", 4);
	}
	hitTime--;


	//Enemy Turn
	if (!playerTurn) && (!instance_exists(objText))
	{
		with (objStatBar)
		{
			takeDamage = true;
		}
		
		messageTimer--;
	
		CreateDSList(ds_messages);
		
		//If no status effects on player
		if (!isAsleep) && (stunned <= 0)
		{
			enemyOption = irandom(array_length(enemyMoveArray) - 1);
		}
		else
		{
			enemyOption = STATUS.ATTACK;
		}
	
		
	
		if (messageTimer <= 0)
		{
			//playerTurn = !playerTurn;
			
			//Choose enemy move
			switch (enemyMoveArray[enemyOption])
			{
				case global.statuses[STATUS.ATTACK]:
					ds_messages[| 0] = enemyName + " attacks!";
					if (RandomChance(enemyAccuracy))
					{
						var damage = CalculateDamage("ENEMY");
						ds_messages[| 1] = "And hits for " + string(damage) + " damage!";
						playerHP -= damage;
						PlaySoundEffect(sEnemyAttack, false);
						ScreenShake(5, 30);
					}
					else
					{
						ds_messages[| 1] = "And misses!";
						PlaySoundEffect(sMiss, true);
					}
					break;
				case global.statuses[STATUS.SLEEP]:
					//Do sleep check/resistance
					ds_messages[| 0] = enemyName + " casts SLEEP!";
					if (RandomChance(enemyAccuracy))
					{
						isAsleep = true;
						ds_messages[| 1] = "PLAYER falls asleep...";
					}
					else
					{
						ds_messages[| 1] = "But PLAYER resists!";
					}
					break;
				case global.statuses[STATUS.STUN]:
					ds_messages[| 0] = enemyName + " casts STUN!";
					if (RandomChance(enemyAccuracy))
					{
						stunned = 3;
						ds_messages[| 1] = "PLAYER gets stunned...";
					}
					else
					{
						ds_messages[| 1] = "But PLAYER resists!";
					}
					break;
			}
			
			EndTurn(ds_messages);
			messageTimer = 60;
		}
	}
	
	#region //Player lost
	if (playerHP <= 0)
	{
		playerDead = true;
		NewTextBox("Player died...", 4)
	}

	if (playerDead)
	{
		battle = false;
		global.gameOver = true;
		RoomTransition(TRANS_TYPE.FADE, rmGameOver);
	}
	#endregion
}
else
{
	//End battle
	if (!instance_exists(objText))
	{
		if (victory)
		{
			global.targetX = global.playerX;
			global.targetY = global.playerY;
			RoomTransition(TRANS_TYPE.FADE, global.currentRoom);// rmVictory);
		}
		else
		{
			global.targetX = global.playerX;
			global.targetY = global.playerY;
			RoomTransition(TRANS_TYPE.FADE, global.currentRoom);
			global.enemiesDefeated[array_length(global.enemiesDefeated) - 1] = -1;
		}
		
		global.battle = false;
		global.gamePaused = false;
		instance_destroy();
	}
}

//Update global variables
global.playerStats[PLAYER_STATS.HPMAX] = playerMaxHP;
global.playerStats[PLAYER_STATS.HPCURRENT] = playerHP;
global.playerStats[PLAYER_STATS.MPMAX] = playerMaxMP;
global.playerStats[PLAYER_STATS.MPCURRENT] = playerMP;