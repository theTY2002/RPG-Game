/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(vk_space))
{
	with (objMenu)
	{
		optionExists = false;
	}
}

page = ArrayControl(vk_right, "D", vk_left, "A", page, menuText);

if (++fadeTime >= fadeTimeDuration)
{
	fadeTime = 0;
	switch(page)
	{
		case PAGES.MOVE:
			with (instance_create_layer(drawXMiddle, drawYTop, "Instances", objControlsPlayerShadow))
			{
				sprite_index = sprControlsPlayerRun;
			}
			break;
		case PAGES.ROLL:
			with (instance_create_layer(drawXMiddle, drawYTop, "Instances", objControlsPlayerShadow))
			{
				sprite_index = sprControlsPlayerRoll;
			}
			break;
	}
}


/*
fadeTimer--;

if (fadeTimer <= 0)
{
	fadeTimer = fadeTime;
	part_particles_create(moveShadow, drawXMiddle - 10, 30, playerShadow, 1);
}