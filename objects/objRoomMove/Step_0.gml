/// @description Insert description here
// You can write your code in this editor

prevTouch = currentTouch;

if (instance_exists(objPlayer)) && position_meeting(objPlayer.x, objPlayer.y, id)
{
	if (!instance_exists(objTransition))
	{
		currentTouch = true;
	}
}
else
{
	currentTouch = false;
}

if (prevTouch && !currentTouch)
{
	with (objPlayer)
	{
		//show_debug_message(string(CARDINAL_DIR));
		if (other.prefDir == "UPDOWN")
		{
			switch(direction)
			{
				case 0:
					other.dir = "RIGHT";
					break;
				case 45:
				case 90:
				case 135:
					other.dir = "UP";
					break;
				case 180:
					other.dir = "LEFT";
					break;
				case 225:
				case 270:
				case 315:
					other.dir = "DOWN";
					break;
			}
		}
		else if (other.prefDir == "LEFTRIGHT")
		{
			switch(direction)
			{
				case 0:
				case 45:
				case 315:
					other.dir = "RIGHT";
					break;
				case 90:
					other.dir = "UP";
					break;
				case 135:
				case 180:
				case 225:
					other.dir = "LEFT";
					break;
				case 270:
					other.dir = "DOWN";
					break;
			}
		}
		/*
		switch(checkDir)
		{
			case 0:
				other.dir = "RIGHT";
				break;
			case 1:
				other.dir = "UP";
				break;
			case 2:
				other.dir = "LEFT";
				break;
			case 3:
				other.dir = "DOWN";
				break;
		}
		*/
	}
	PlayerMove(dir);
}

