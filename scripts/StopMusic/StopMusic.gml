// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function StopMusic(music){
	if (audio_is_playing(music))
	{
		//audio_stop_sound(music);
		audio_sound_gain(music, 0, 1000);
		//show_debug_message(string(audio_sound_get_gain(music)));
		
		//audio_sound_gain(music, 1, 3000)
		//audio_play_sound(music, 2, true);
	}
	//audio_stop_sound(music);
}