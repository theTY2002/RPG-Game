/// @description Insert description here
// You can write your code in this editor
//show_debug_message("RUNNING");
event_inherited();

if (!instance_exists(objMinimapDraw))
{
	var _file = file_text_open_read(working_directory + fileName);
	
	var _row = 0;
	var _column = 0;
	var _line = " ";

	while(_line != "")
	{
		_line = file_text_read_string(_file);
		if (string_length(_line) > 0)
		{
			for (var i = 0; i < string_length(_line); i++)
			{
				_column = i;
				currentChar = string_char_at(_line, i + 1);
				switch(currentChar)
				{
					case "X":
						minimap[_row][_column] = [MAPSTATES.WALL, 0];
						break;
					case "O":
						minimap[_row][_column] = [MAPSTATES.HIDDEN, 0];
						break;
					default:
						minimap[_row][_column] = [MAPSTATES.DISCOVERED, 0];
						break;
				}
				//show_debug_message("ROW: " + string(_row));
				//show_debug_message("COLUMN: " + string(_column));
				//show_debug_message(minimap[_row][_column]);
				//show_debug_message(array_length(minimap));
				//show_debug_message(array_length(minimap[_row]));
				//show_debug_message(minimap);
			}
			_row++;
		}
		file_text_readln(_file);	
	}
	
	//show_debug_message(array_length(minimap));
	//show_debug_message(array_length(minimap[0]));

	
	file_text_close(_file);

	global.minimap = minimap;
	
	show_debug_message(minimap);
	
	//global.iconMinimap = minimap;
	//Set Player Location
	global.locationX = locationX;
	global.locationY = locationY;

	instance_create_layer(0, 0, "Instances", objMinimapDraw);
}