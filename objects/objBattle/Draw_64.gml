/// @description Insert description here
// You can write your code in this editor
if (room == rmBattle)// battle)
{
	optionX = 18;
	optionY = RESOLUTION_H - 70;
	menuWidth = 50;

	DrawSetText(fBattle, fa_left, fa_top, c_white);
	fontSize = font_get_size(fBattle);
	var BUFFER = 6;
	
	if (playerTurn) && (!instance_exists(objText) && (messageTimer <= 0))
	{
		if (!showMagicOptions) && (!showInventoryOptions)
		{
			#region //Draw Battle Options
		
			DrawSetText(fBattle, fa_left, fa_top, c_white);
			for (var i = 0; i < array_length(global.optionText); i++)
			{
				if (selectedOption == i)
				{
					draw_sprite(sprArrow, 0, optionX - sprite_get_width(sprArrow), (optionY + (fontSize + BUFFER) * i) + 2);
				}
			}
			#endregion
		}
		else
		{
			#region //Draw Magic Options
			if (showMagicOptions)
			{
				DrawSetText(fBattle, fa_left, fa_top, c_white);
				for (var j = 0; j < array_length(global.spells[0]); j++)
				{
					if (magicOption == j)
					{
						draw_sprite(sprArrow, 0, optionX + menuWidth - sprite_get_width(sprArrow), (optionY + (fontSize + BUFFER) * j) + 2);
					}
				}
	
				for (var j = 0; j < array_length(global.spells); j++)
				{
					text = global.spells[j, SPELL_STATS.NAME];
					draw_text(optionX + menuWidth, optionY + (fontSize + BUFFER) * j, text);
				}
			}
			#endregion
		
			#region //Draw Inventory Options
			if (showInventoryOptions)
			{
				DrawSetText(fBattle, fa_left, fa_top, c_white);
				currItem = ds_map_find_first(global.inventory);
				for (var k = 0; k < ds_map_size(global.inventory); k++)
				{
					if (inventoryOption == k)
					{
						draw_sprite(sprArrow, 0, optionX + menuWidth - sprite_get_width(sprArrow), (optionY + (fontSize + BUFFER) * k) + 2);
					}
					currItem = ds_map_find_next(global.inventory, currItem);
				}

				currItem = ds_map_find_first(global.inventory);
				for (var k = 0; k < ds_map_size(global.inventory); k++)
				{
					text = ConvertObjectName(currItem);
					number = ds_map_find_value(global.inventory, currItem);
					draw_text(optionX + menuWidth, optionY + (fontSize + BUFFER) * k, text + " x " + string(number));
					currItem = ds_map_find_next(global.inventory, currItem);
				}
			}
			#endregion
			DrawSetText(fBattle, fa_left, fa_top, c_gray);
		}
	}
	else
	{
		DrawSetText(fBattle, fa_left, fa_top, c_gray);
	}
	
	for (var i = 0; i < array_length(global.optionText); i++)
	{
		text = global.optionText[i];
		draw_text(optionX, optionY + (fontSize + BUFFER) * i, text);
	}

	//DRAW PLAYER HP (TEMPORARY)
	//DrawSetText(fBattle, fa_bottom, fa_right, c_white);
	//hpX = 40;
	//hpY = RESOLUTION_H - BUFFER;
	//draw_text(hpX, hpY, string(playerHP) + " / " + string(playerMaxHP));
	//draw_text(hpX, hpY + 10, string(playerMP) + " / " + string(playerMaxMP));
	
	//Testing
	//draw_text(hpX, hpY - 10, string(GetPlayerStat("XP")));
	//draw_text(hpX, hpY - 20, string(GetPlayerStat("GOLD")));
}

//TEMPORARY MONSTER SPRITE
mx = RESOLUTION_W / 2;
my = RESOLUTION_H / 2;

if (battle)
{
	alpha = min(1, alpha + 0.05);
	//draw_sprite(enemySprite, image_index / 8, mx, my);
	
	//Draw Enemy Name
	DrawSetText(fBattle, fa_center, fa_middle, c_white);
	draw_text(mx, my + (sprite_get_height(enemySprite)) + 2, enemyName);
}
else
{
	alpha = max(0, alpha - 0.05);
	//draw_sprite(enemySprite, image_index / 8, mx, my);
	
}


if (hitTime >= 0)
{
	shader_set(shRedFlash);
	shader_set_uniform_f(uRedFlash, hitTime / 8.0);
	image_blend = enemyColour;
	draw_sprite_ext(enemySprite, image_index / 8, mx, my, 1, 1, 0, image_blend, alpha);
	image_blend = c_white;
}
else
{	
	image_blend = enemyColour;
	draw_sprite_ext(enemySprite, image_index / 8, mx, my, 1, 1, 0, image_blend, alpha);
	image_blend = c_white;
}

if (shader_current() != -1)
{
	shader_reset();
}