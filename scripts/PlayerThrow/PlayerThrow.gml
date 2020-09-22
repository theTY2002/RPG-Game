function PlayerThrow() {
	with (global.iLifted)
	{
		lifted = false;
		persistent = false;
		thrown = true;
	
		z = LIFTED_Z;
		throwPeakHeight = z + 10;
		//throwDistance = entitythrowDistance;
		throwDistanceTravelled = 0;
		//LIFTED_Z/Peak = percent of the way to peak
		//divide by 2 is the percent of the whole arc
		throwStartPercent = (LIFTED_Z/throwPeakHeight) * 0.5;
		throwPercent = throwStartPercent;
		direction = other.direction;
		xstart = x;
		ystart = y;
	}

	PlayerActOutAnimation(sprPlayerLift);
	global.iLifted = noone;
}
