function PlayerCollision() {
	var _collision = false;
	var _entityList = ds_list_create();

	//Horizontal Tiles
	if (sign(xSpeed) == 1)
	{
		if (tilemap_get_at_pixel(collisionMap, bbox_right + xSpeed, y))
		{
			x -= x mod TILE_SIZE;
			x -= TILE_SIZE / 2.5;
			if (sign(xSpeed) == 1)
			{
				x += TILE_SIZE - 1;
			}
			xSpeed = 0;
			_collision = true;
		}
	}
	else
	{
		if (tilemap_get_at_pixel(collisionMap, bbox_left + xSpeed, y))
		{
			x -= x mod TILE_SIZE;
			x += TILE_SIZE / 2.5;
			if (sign(xSpeed) == 1)
			{
				x += TILE_SIZE - 1;
			}
			xSpeed = 0;
			_collision = true;
		}
	}
	
	/*
	if (tilemap_get_at_pixel(collisionMap, x + xSpeed, y))
	{
		x -= x mod TILE_SIZE;
		if (sign(xSpeed) == 1)
		{
			x += TILE_SIZE - 1;
		}
		xSpeed = 0;
		_collision = true;
	}
	*/

	//Horizontal Entities
	var _entityCount = instance_position_list(x + xSpeed, y, parentEntity, _entityList, false);
	var _snapX;
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0];
		if (_entityCheck.entityCollision == true) && (_entityCheck.lifted != true)
		{
			//Move as close as we can
			if (sign(xSpeed) == -1)
			{
				_snapX = _entityCheck.bbox_right + 1;
			}
			else
			{
				_snapX = _entityCheck.bbox_left - 1;
			}
			x = _snapX;
			xSpeed = 0;
			_collision = true;
			_entityCount = 0;
		
			//If enemy
			if (object_is_ancestor(_entityCheck.object_index, parentEnemy)) && (!instance_exists(objBattle)) && (global.iFrame <= 0)
			{
				with (_entityCheck)
				{
					ScriptExecuteArray(_entityCheck.entityActivateScript, _entityCheck.entityActivateArgs);
				}
			}
		
			//Add consumables
			if (_entityCheck.entityConsumable == true)
			{
				with (_entityCheck)
				{
					ScriptExecuteArray(_entityCheck.entityActivateScript, _entityCheck.entityActivateArgs);
					_collision = false;
				}
			}
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}

	//Horizontal Move Commit
	x += xSpeed;

	ds_list_clear(_entityList);

	//Vertical Tiles
	if (tilemap_get_at_pixel(collisionMap, x, y + ySpeed))
	{
		y -= y mod TILE_SIZE;
		if (sign(ySpeed) == 1)
		{
			y += TILE_SIZE - 1;
		}
		ySpeed = 0;
		_collision = true;
	}

	//Vertical Entities
	var _entityCount = instance_position_list(x, y + ySpeed, parentEntity, _entityList, false);
	var _snapY;
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0];
		if (_entityCheck.entityCollision == true) && (_entityCheck.lifted != true)
		{
			//Move as clase as we can
			if (sign(ySpeed) == -1)
			{
				_snapY = _entityCheck.bbox_bottom + 1;
			}
			else
			{
				_snapY = _entityCheck.bbox_top - 1;
			}
			y = _snapY;
			ySpeed = 0;
			_collision = true;
			_entityCount = 0;
		
			//If Enemy
			if (object_is_ancestor(_entityCheck.object_index, parentEnemy)) && (!instance_exists(objBattle)) && (global.iFrame <= 0)
			{
				with (_entityCheck)
				{
					ScriptExecuteArray(_entityCheck.entityActivateScript, _entityCheck.entityActivateArgs);
				}
			}
		
			//Add consumables
			if (_entityCheck.entityConsumable == true)
			{
				with (_entityCheck)
				{
					ScriptExecuteArray(_entityCheck.entityActivateScript, _entityCheck.entityActivateArgs);
					_collision = false;
				}
			}
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}

	//Vertical Move Commit
	y += ySpeed;

	ds_list_destroy(_entityList);

	return _collision;


}
