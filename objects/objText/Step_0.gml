/// @description Insert description here
// You can write your code in this editor

lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

//Cycle through responses

/*
keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
responseSelected += (keyDown - keyUp);

var _max = array_length(responses) - 1;
var _min = 0;
if (responseSelected > _max)
{
	responseSelected = _min;
}

if (responseSelected > _min)
{
	responseSelected = _max;
}
*/

responseSelected = ArrayControl(vk_down, "S", vk_up, "W", responseSelected, responses);
//show_debug_message(string(responseSelected));


if (keyboard_check_pressed(vk_space))
{
	var _messageLength = string_length(message);
	if (textProgress >= _messageLength)
	{
		if (responses[0] != -1)
		{
			with (originInstance)
			{
				DialogueResponses(other.responseScripts[other.responseSelected]);
			}
		}
		
		if(global.hatQuest)
		{
			global.giveHat = true;
		}
		
		global.gamePaused = false;
		instance_destroy();
		
		if (instance_exists(objTextQueued))
		{
			with (objTextQueued)
			{
				ticket--;
			}
		}
		else
		{
			with (objPlayer)
			{
				state = lastState;
			}
		}
	}
	else
	{
		if (textProgress > 2)
		{
			textProgress = _messageLength;
		}
	}
}