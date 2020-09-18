/// @description Insert description here
// You can write your code in this editor
//ScreenShake(4, 40);
//titleY = titleY + 1;
//titleY = min(titleY + 10, titleYTo)//lerp(titleY, titleYTo, 0.1);
titleZ = max(titleZ * 0.9, titleZTo);

show_debug_message("titleZ: " + string(round(titleZ)));
show_debug_message(string(round(titleZ) <= titleZTo));
if (titleZ <= titleZTo) && (!shake)
{
	//show_debug_message("YEE");
	ScreenShake(4, 40);
	PlaySoundEffect(sTitleCrash, false);
	global.gameStart = true;
	shake = true;
}

if (!instance_exists(objOptions))
{
	menuIndex = ArrayControl(vk_down, "S", vk_up, "W", menuIndex, buttons);
}
show_debug_message(string(menuIndex));

var i = 0;
repeat(buttonNumber)
{
	if (unfold[i] >= 1)
	{
		i++;
	}
	
	if (i < buttonNumber)
	{
		unfold[i] = min(1, unfold[i] + .02);
	}
	
	if (i + 1 < buttonNumber)
	{
		unfold[i + 1] = min(1, unfold[i + 1] + .005);
	}
}



if (menuIndex != lastSelected)
{
	show_debug_message("YEE");
	part_particles_create(boxFlash, menuX, menuY + buttonHeight / 2 + (buttonHeight + buttonPadding) * menuIndex, boxFlash, 1);
}

lastSelected = menuIndex;

if (keyboard_check_pressed(vk_space))
{
	switch(menuIndex)
	{
		case MENUOPTIONS.NEWGAME:
			RoomTransition(TRANS_TYPE.FADE, rmVillage);
			break;
		case MENUOPTIONS.OPTIONS:
		
			if (!instance_exists(objOptions))
			{
				instance_create_depth(x, y, -9999, objOptions);
			}
			else
			{
				if (!optionExists)
				{
					instance_destroy(objOptions);
				}
			}
			break;
		case MENUOPTIONS.EXIT:
			game_end();
			break;
	}
	//ScreenShake(2, 30);
}