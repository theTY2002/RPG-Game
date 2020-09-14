///@desc PlayerMove(direction)
///@arg direction
function PlayerMove(argument0) {
	switch(argument0)
	{
		case "RIGHT":
			if (array_get(global.minimap[global.locationY][global.locationX + 1], 0) != MAPSTATES.WALL)
			{
				global.locationX++;
				objMinimapDraw.moved = "RIGHT";
			}
			break;
		case "LEFT":
			if (array_get(global.minimap[global.locationY][global.locationX - 1], 0) != MAPSTATES.WALL)
			{
				global.locationX--;
				objMinimapDraw.moved = "LEFT";
			}
			break;
		case "UP":
			if (array_get(global.minimap[global.locationY - 1][global.locationX], 0) != MAPSTATES.WALL)
			{
				global.locationY--;
				//show_debug_message("SCRIPT:" + string(global.minimap[1][1][0]));
				objMinimapDraw.moved = "UP";
			}
			break;
		case "DOWN":
			if (array_get(global.minimap[global.locationY + 1][global.locationX], 0) != MAPSTATES.WALL)
			{
				global.locationY++;
				objMinimapDraw.moved = "DOWN";
			}
			break;
		default:
			show_debug_message("INVALID DIRECTION");
			break;
	}


}
