///@arg incrementKey
///@arg incrementLetter
///@arg decrementKey
///@arg decrementLetter
///@arg countVar
///@arg array
function ArrayControl(argument0, argument1, argument2, argument3, argument4, argument5) {

	//show_debug_message(string(array_height_2d(argument5)))

	countVar = argument4;
	tempArray = argument5;

	if is_array(argument5)
	{
		if (array_length(argument5[0]) > 1)
		{
			if (keyboard_check_pressed(argument0) || keyboard_check_pressed(ord(argument1)))
			{
				if ((countVar + 1) <= array_length(tempArray[0]) - 1)
				{
					countVar++;
				}
				else
				{
					countVar = 0;
				}
				audio_play_sound(sSelect, 1, false);
			}

			if (keyboard_check_pressed(argument2) || keyboard_check_pressed(ord(argument3)))
			{
				if ((countVar - 1) >= 0)
				{
					countVar--;
				}
				else
				{
					countVar = array_length(tempArray[0]) - 1;
				}
				audio_play_sound(sSelect, 1, false);
			}
		}
		else
		{
			if (keyboard_check_pressed(argument0) || keyboard_check_pressed(ord(argument1)))
			{
				if ((countVar + 1) <= array_length(tempArray) - 1)
				{
					countVar++;
				}
				else
				{
					countVar = 0;
				}
				audio_play_sound(sSelect, 1, false);
			}

			if (keyboard_check_pressed(argument2) || keyboard_check_pressed(ord(argument3)))
			{
				if ((countVar - 1) >= 0)
				{
					countVar--;
				}
				else
				{
					countVar = array_length(tempArray) - 1;
				}
				audio_play_sound(sSelect, 1, false);
			}
		}
	}
	else
	{
		if (keyboard_check_pressed(argument0) || keyboard_check_pressed(ord(argument1)))
		{
			if ((countVar + 1) <= ds_map_size(tempArray) - 1)
			{
				countVar++;
			}
			else
			{
				countVar = 0;
			}
			audio_play_sound(sSelect, 1, false);
		}

		if (keyboard_check_pressed(argument2) || keyboard_check_pressed(ord(argument3)))
		{
			if ((countVar - 1) >= 0)
			{
				countVar--;
			}
			else
			{
				countVar = ds_map_size(tempArray) - 1;
			}
			audio_play_sound(sSelect, 1, false);
		}
	}

	return countVar;
}
