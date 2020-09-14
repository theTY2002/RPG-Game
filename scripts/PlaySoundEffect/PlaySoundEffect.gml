// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlaySoundEffect(sound, pitchShift)
{
	if (pitchShift)
	{
		audio_sound_pitch(sound, random_range(0.8, 1.2));
	}
	audio_play_sound(sound, 5, false);
}