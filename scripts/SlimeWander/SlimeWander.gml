function SlimeWander() {
	sprite_index = sprMove;

	//At destination || given up?
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed)
	{
		xSpeed = 0;
		ySpeed = 0;
		//End move animation
		if (image_index < 1)
		{
			image_speed = 0.0;
			image_index = 0;
		}
	
		//Set new target destination
		if (++wait >= waitDuration)
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	}
	else //Move towards new destination
	{
		timePassed++;
		image_speed = 1.0;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _speedThisFrame = enemySpeed;
		//If going to overshoot
		if (_distanceToGo < enemySpeed)
		{
			_speedThisFrame = _distanceToGo;
		}
	
		if (xTo < 0 || xTo > room_width) || (yTo < 0 || yTo > room_height)
		{
			xTo = x - lengthdir_x(enemyWanderDistance, dir) * 2;
			yTo = y - lengthdir_y(enemyWanderDistance, dir) * 2;
		}
		
		dir = point_direction(x, y, xTo, yTo);
		xSpeed = lengthdir_x(_speedThisFrame, dir);
		ySpeed = lengthdir_y(_speedThisFrame, dir);
		
		if (xSpeed != 0)
		{
			image_xscale = sign(xSpeed);
		}
	
		//Collide & move
		var _collided = EnemyTileCollision();
	}

	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(objPlayer)) && (point_distance(x, y, objPlayer.x, objPlayer.y) <= enemyAggroRadius) && (global.iFrame <= 0)
		{
			state = ENEMYSTATE.CHASE;
			target = objPlayer;
		}
	}

}
