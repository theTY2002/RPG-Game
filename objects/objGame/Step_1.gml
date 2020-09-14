/// @description Insert description here
// You can write your code in this editor
if (global.gamePaused)
{
	with (parentEntity)
	{
		gamePausedImageSpeed = image_speed;
		image_speed = 0;
	}
}
else
{
	with (parentEntity)
	{
		image_speed = gamePausedImageSpeed;
	}
}