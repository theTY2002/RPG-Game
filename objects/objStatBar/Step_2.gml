/// @description Insert description here
// You can write your code in this editor
hpCurrent = GetPlayerStat("HP");
hpMax = GetPlayerStat("MAX HP");
hpMin = 0;

mpCurrent = GetPlayerStat("MP");
mpMax = GetPlayerStat("MAX MP");
mpMin = 0;

/*
if (keyboard_check_pressed(ord("M")))
{
	takeDamage = !takeDamage;
}
*/


/*
if (keyboard_check_pressed(vk_enter))
{
	hpMax += 10;
	hpCurrent = hpMax;
}

if (keyboard_check_pressed(ord("I")))
{
	hpCurrent += 10;
}

if (keyboard_check_pressed(vk_space))
{
	var damageTaken = irandom_range(damageMin, damageMax);
	
	if ((hpCurrent - damageTaken) >= 0)
	{
		hpCurrent -= damageTaken;
	}
	else
	{
		hpCurrent = 0;
	}
}
*/

//Health
if (takeDamage)
{
	xScaleYellow = hpTemp / hpMax;
	xScaleGreen = hpCurrent / hpMax;
}
else
{
	xScaleYellow = hpCurrent / hpMax;
	xScaleGreen = hpTemp / hpMax;
}


if (hpTemp > hpCurrent)
{
	hpTemp -= hpMax / 200;
}

if (hpTemp < hpCurrent)
{
	hpTemp += hpMax / 200;
}

//Mana
if (takeMana)
{
	xScaleCyan = mpTemp / mpMax;
	xScaleBlue = mpCurrent / mpMax;
}
else
{
	xScaleCyan = mpCurrent / mpMax;
	xScaleBlue = mpTemp / mpMax;
}

if (mpTemp > mpCurrent)
{
	mpTemp -= mpMax / 200;
}

if (mpTemp < mpCurrent)
{
	mpTemp += mpMax / 200;
}