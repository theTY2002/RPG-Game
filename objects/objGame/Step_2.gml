/// @description Pause Game
// You can write your code in this editor
if (keyboard_check_pressed(vk_escape))
{
	global.gamePaused = !global.gamePaused;
}