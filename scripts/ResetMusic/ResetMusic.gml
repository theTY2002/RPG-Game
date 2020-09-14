// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ResetMusic(oldMusic, newMusic){
	//audio_sound_gain(oldMusic, 0, 3000);
	audio_stop_all();
	//audio_sound_gain(oldMusic, 1, 0);
	return newMusic;
}