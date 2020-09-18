// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayMusic(music){
	audio_sound_gain(music, 1, 1000);
	if (!audio_is_playing(music))
	{
		audio_play_sound(music, 2, true);
		//return soundID;
	}
	//return sVillageMusic;
}