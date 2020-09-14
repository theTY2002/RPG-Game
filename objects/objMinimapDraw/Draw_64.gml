/// @description Insert description here
// You can write your code in this editor
var _minimap = global.minimap;
show_debug_message(_minimap);
//var _iconMinimap = global.minimap;

//Rows before columns
var _rows = array_length(_minimap) - 1;
var _columns = array_length(_minimap[0]) - 1;
show_debug_message(string(_rows));
show_debug_message(string(_columns));

var _maxSizeX = _columns * spacing;
var _maxSizeY = _rows * spacing;

var _locationX = global.locationX;
var _locationY = global.locationY;

//show_debug_message("DEBUG:" + string(_minimap[1][1][0]));

switch(moved)
{
	case "RIGHT":
		_minimap[_locationY][_locationX - 1] = [MAPSTATES.DISCOVERED, ICONSTATES.EMPTY];
		break;
	case "LEFT":
		_minimap[_locationY][_locationX + 1] = [MAPSTATES.DISCOVERED, ICONSTATES.EMPTY];
		break;
	case "UP":
		//show_debug_message("BEFORE:" + string(_minimap[1][1][0]));
		_minimap[_locationY + 1][_locationX] = [MAPSTATES.DISCOVERED, ICONSTATES.EMPTY];
		//show_debug_message("RUNNING");
		//show_debug_message("MOVE:" + string(_locationY + 1) + "," + string(_locationX));
		show_debug_message("LOC Y:" + string(_locationY + 1));
		show_debug_message("LOC X:" + string(_locationX));
		show_debug_message("RUNNING:" + string(_minimap[_locationY + 1][_locationX]));
		break;
	case "DOWN":
		_minimap[_locationY - 1][_locationX] = [MAPSTATES.DISCOVERED, ICONSTATES.EMPTY];
		break;
}

_minimap[_locationY][_locationX] = [MAPSTATES.DISCOVERED, ICONSTATES.PLAYER];
//_iconMinimap[_locationY, _locationX] = MAPSTATES.PLAYER;
global.minimap = _minimap;

//Focus toggle
if (isFocused)
{
	spacing = lerp(spacing, 16, 0.1);
	gWidth = lerp(gWidth, RESOLUTION_W / 2, 0.1);
	gHeight = lerp(gHeight, RESOLUTION_H / 2, 0.1);
}
else
{
	spacing = lerp(spacing, 8, 0.1);
	gWidth = lerp(gWidth, RESOLUTION_W - _maxSizeX, 0.1);
	gHeight = lerp(gHeight, RESOLUTION_H - _maxSizeY, 0.1);
}

if (!global.battle)
{
	show_debug_message("DEBUG: " + string(_minimap[1][2]));
	//show_debug_message(_minimap[1][0]);
	//Draw
	for (var row = 0; row <= _rows; row++)
		{
			for (var column = 0; column <= _columns; column++)
			{
				//show_debug_message("ROW: " + string(row));
				//show_debug_message("COLUMN: " + string(column));
				
				
				var xx = (gWidth - (_maxSizeX / 2) + (column * spacing));
				var yy = (gHeight - (_maxSizeY / 2) + (row * spacing));
			
				draw_set_colour(c_white);
				
				//show_debug_message(_minimap[1][1][0]);
				//show_debug_message(is_array(_minimap[row][column]));
				show_debug_message("ROW: " + string(row));
				show_debug_message("COLUMN: " + string(column));
				show_debug_message(array_length(_minimap));
				show_debug_message(array_length(_minimap[row]));
				//show_debug_message(_minimap[row]);
				show_debug_message(_minimap[row][column]);
				
				
				switch(array_get(_minimap[row][column], 0))//(_minimap[row][column][0])
				{
					case MAPSTATES.HIDDEN:
						draw_set_colour(c_gray);
						draw_rectangle(xx, yy, xx + spacing, yy + spacing, false);
						break;
					case MAPSTATES.DISCOVERED:
						draw_set_colour(c_white);
						draw_rectangle(xx, yy, xx + spacing, yy + spacing, false);
						//show_debug_message("ROW: " + string(row));
						//show_debug_message("COL: " + string(column));
						break;
					case MAPSTATES.WALL:
						draw_set_colour(c_dkgray);
						draw_rectangle(xx, yy, xx + spacing, yy + spacing, false);
						break;
					
				}
			
				switch(array_get(_minimap[row][column], 1))//(_minimap[row][column][1])
				{
					case ICONSTATES.EMPTY:
						draw_rectangle(xx, yy, xx + spacing, yy + spacing, false);
						break;
					case ICONSTATES.PLAYER:
						draw_sprite(sprPlayerIcon, 0, xx + spacing / 2, yy + spacing / 2);
						//show_debug_message("RUNNING");
						//show_debug_message("HI");
						break;
				}
			}
		}
}
