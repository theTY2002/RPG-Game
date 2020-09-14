// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeAttack(){
	var _spd = enemySpeed;
	image_speed = 1;
	//Don't move while getting ready to jump
	if (image_index < 2)
	{
		_spd = 0;
	}
	
	//Freeze animation while in mid-air and after landing
	if (floor(image_index) == 3) || (floor(image_index == 5))
	{
		image_speed = 0;
	}
	
	//How far to jump
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	//Begin landing
	if (_distanceToGo < 4) && (image_index < 5 )
	{
		image_speed = 1;
	}
	
	//Move
	if (_distanceToGo > _spd)
	{
		dir = point_direction(x, y, xTo, yTo);
		xSpeed = lengthdir_x(_spd, dir);
		ySpeed = lengthdir_y(_spd, dir);
		if (xSpeed != 0)
		{
			image_xscale = sign(xSpeed);
		}
		
		if (EnemyTileCollision() == true)
		{
			xTo = x;
			yTo = y;
		}
	}
	else
	{
		x = xTo;
		y = yTo;
		
		if (floor(image_index) == 5)
		{
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
}