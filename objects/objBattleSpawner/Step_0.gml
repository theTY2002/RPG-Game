/// @description Insert description here
// You can write your code in this editor
if (!global.gamePaused) && (state == "NO BATTLE")
{
	spawnTimer++;
	if (spawnTimer >= timeTillBattle)
	{
		
		state = "INIT";
	}
}


if (state == "INIT")
{
	global.gamePaused = true;
	
	monX = objPlayer.x;
	monY = objPlayer.y;
	
	monster = instance_create_layer(monX, monY, layer, objMonster);
	
	with (monster)
	{
		type = global.spawn;
		sprite_index = global.enemyStats[type, ENEMY_STATS.SPRITE];
		hp = global.enemyStats[type, ENEMY_STATS.HP];
		attack = global.enemyStats[type, ENEMY_STATS.ATTACK];
		defense = global.enemyStats[type, ENEMY_STATS.DEFENSE];
		xp = global.enemyStats[type, ENEMY_STATS.XP];
		gold = global.enemyStats[type, ENEMY_STATS.GOLD];
		name = global.enemyStats[type, ENEMY_STATS.NAME];
	}
	
	hero = instance_create_layer(x, y, layer, objHero);
	
	with (hero)
	{
		hp = global.playerStats[type, PLAYER_STATS.HPCURRENT];
		hpMax = global.playerStats[type, PLAYER_STATS.HPMAX];
		attack = global.playerStats[type, PLAYER_STATS.ATTACK];
		defense = global.playerStats[type, PLAYER_STATS.DEFENSE];
		mp = global.playerStats[type, PLAYER_STATS.MPCURRENT];
		mpMax = global.playerStats[type, PLAYER_STATS.MPMAX];
		xp = global.playerStats[type, PLAYER_STATS.XP];
		gold = global.playerStats[type, PLAYER_STATS.GOLD];
		name = global.playerStats[type, PLAYER_STATS.NAME];
	}
	
	
	playerTurn = true;
	selectedOption = OPTIONS.ATTACK;
	maxOptions = OPTIONS.LAST;
	
	optionState = "MAIN"; //Main or Attack or Item or Run or Battle Over
	victoryState = "INIT"; //Init or Player Won or Monster Won or Player Ran
	
	state = "READY";
	textToDisplay = "You have encountered a " + global.enemyStats[monster.type, ENEMY_STATS.NAME];
	visibleString = "";
	
	monsterTimer = 0;
	timeTillMonsterActs = 30;
	
	spawnTimer = 0;
	timeTillBattle = irandom_range(minSpawnTime, maxSpawnTime);
	
	//Clear magic list
	if ds_exists(ds_magic_list, ds_type_list)
	{
		ds_list_clear(ds_magic_list);
		
		for (var spell = 0; spell < SPELL.LAST; spell++)
		{
			if (global.spells[spell, SPELL_STATS.KNOWN] == true)
			{
				ds_list_add(ds_magic_list, spell);
			}
		}
	}
	else
	{
		show_message("ERROR NO MAGIC LIST FOUND");
	}
	
}

if (state == "READY")
{
	if (string_length(visibleString) < string_length(textToDisplay))
	{
		var nextChar = string_length(visibleString) + 1;
		
		visibleString += string_char_at(textToDisplay, nextChar);
	}
}