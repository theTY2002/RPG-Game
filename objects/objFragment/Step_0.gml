/// @description Insert description here
// You can write your code in this editor
if (!global.gamePaused)
{
	//Bounce
	if (bounceCount != 0)
	{
		//Bounce is a number between 0 and pi, how far through the bounce
		bounce += (pi * bounceSpeed);
		if (bounce > pi)
		{
			bounce -= pi;
			bounceHeight *= 0.6;
			bounceCount--;
		}
		z = sin(bounce) * bounceHeight;
	}
	else
	{
		z = 0;
	}
	
	//Fade
	fade++;
	//fadeAfter is how many frames after the object's creation that it fades
	if (fade > fadeAfter)
	{
		image_alpha -= 1/fadeTime;
		if (image_alpha <= 0)
		{
			instance_destroy();
		}
	}
	
	//Friction
	fric = 0.05;
	if (z == 0)
	{
		fric = 0.1;
	}
	
	//Move
	x += lengthdir_x(spd, direction);
	y += lengthdir_y(spd, direction);
	if (tilemap_get_at_pixel(collisionMap, x, y) > 0)
	{
		spd = 0;
	}
	spd = max(spd - fric, 0);
	
}