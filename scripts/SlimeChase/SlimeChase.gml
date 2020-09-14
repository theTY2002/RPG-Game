// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeChase(){
	sprite_index = sprMove;
	if (instance_exists(target)) && (global.iFrame <= 0)
	{
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed)
		{
			xSpeed = lengthdir_x(enemySpeed, dir);
			ySpeed = lengthdir_y(enemySpeed, dir);
		}
		else
		{
			xSpeed = lengthdir_x(_distanceToGo, dir);
			ySpeed = lengthdir_y(_distanceToGo, dir);
		}
		
		if (xSpeed != 0)
		{
			image_xscale = sign(xSpeed);
		}
		
		EnemyTileCollision();
	}
	else
	{
		state = ENEMYSTATE.WANDER;
	}
	
	if (instance_exists(target)) && (point_distance(x, y, target.x, target.y) <= enemyAttackRadius)
	{
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1;
		//Target 8 px past the player
		xTo += lengthdir_x(8, dir);
		yTo += lengthdir_y(8, dir);
	}
	
	if (instance_exists(objPlayer)) && (point_distance(x, y, objPlayer.x, objPlayer.y) >= enemyAggroRadius * 1.5) && (global.iFrame <= 0)
	{
		state = ENEMYSTATE.WANDER;
	}
}

	