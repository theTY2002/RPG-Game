/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(ord("M"))
{
	global.musicPaused = !global.musicPaused;
	if (global.musicPaused)
	{
		audio_master_gain(0);
		//audio_pause_all();
	}
	else
	{
		audio_master_gain(1);
	}
}

if (room != rmGameOver)
{
	if (global.battle)
	{
		if (currentMusic != sBattleMusic)
		{
			StopMusic(currentMusic);
			currentMusic = sBattleMusic;
		}
	}
	else
	{
		if (currentMusic != sVillageMusic)
		{
			StopMusic(currentMusic);
			currentMusic = sVillageMusic;
		}
	}

	PlayMusic(currentMusic);
}
else
{
	StopMusic(currentMusic);
	PlayMusic(sGameOver);
}
