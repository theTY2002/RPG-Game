/// @description Entity Loop
// You can write your code in this editor

if (!global.gamePaused)
{
	depth = -bbox_bottom;
	if (lifted) && (instance_exists(objPlayer))
	{
		x = objPlayer.x;
		y = objPlayer.y;
		z = objPlayer.z + LIFTED_Z;
		depth = objPlayer.depth - 1;
	}
	
	if (!lifted)
	{
		//Be thrown
		if (thrown)
		{
			throwDistanceTravelled = min(throwDistanceTravelled + entityThrowSpeed, entityThrowDistance);
			x = xstart + lengthdir_x(throwDistanceTravelled, direction);
			y = ystart + lengthdir_y(throwDistanceTravelled, direction);
			if (tilemap_get_at_pixel(collisionMap, x, y) > 0)
			{
				thrown = false;
				grav = 0.1;
			}
			//Percent from 0 to end percent
			throwPercent = throwStartPercent + lerp(0, 1 - throwStartPercent, throwDistanceTravelled / entityThrowDistance);
			z = throwPeakHeight * sin(throwPercent * pi);
			if (entityThrowDistance == throwDistanceTravelled)
			{
				thrown = false;
				if (entityThrowBreak)
				{
					instance_destroy();
				}
			}
		}
		else
		{
			//fall down if z > 0
			if (z > 0)
			{
				z = max(z - grav, 0);
				grav += 0.1;
				if (z == 0) && (entityThrowBreak)
				{
					instance_destroy();
				}
			}
			else
			{
				grav = 0.1;
			}
		}
	}
}

flash = max(flash - 0.04, 0);