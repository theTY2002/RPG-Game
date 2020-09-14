/// @description Insert description here
// You can write your code in this editor
mouseClick = false;

#region

if (showInventory)
{
	invY = lerp(invY, RESOLUTION_H - itemH, 0.1);
}
else
{
	invY = lerp(invY, RESOLUTION_H + itemH, 0.1);
}

currItem = ds_map_find_first(global.inventory);
for (var i = 0; i < ds_map_size(global.inventory); i++)
{
	itemX = invX + (i * (itemW * 2));
	itemY = invY;
	
	objName = object_get_name(currItem);
	
	name = ConvertItemName(objName);
	//objDesc = name + " x" + string(ds_map_find_value(global.inventory, currItem));
	
	switch (currItem)
	{
		case objMushroomRedS:
			objDesc = global.itemText[ITEMTEXT.REDMUSHROOMSMALL];
			break;
		case objBushBerryRed:
			objDesc = global.itemText[ITEMTEXT.REDBERRY];
			break;
		case objBushBerryBlue:
			objDesc = global.itemText[ITEMTEXT.BLUEBERRY];
			break;
		default:
			objDesc = name + " x" + string(ds_map_find_value(global.inventory, currItem));
			break;
	}
	
	//Mouse
	if (abs(itemX - global.mouseX) <= itemW) && (abs(itemY - global.mouseY) <= itemH)
	{
		//Draw text
		NineSliceBoxStretched(sprItemUI, drawX - 2, drawY, drawX + string_width(objDesc) + 2, drawY + string_height(objDesc) + 2, 0);
		
		DrawSetText(fText, fa_left, fa_top, c_white);
		draw_text(drawX + 2, drawY + 2, objDesc);
		
		if (mouse_check_button(mb_left))
		{
			if (!mouseClick)
			{
				selectedItem = i;
			}
			mouseClick = true;
		}
	}
	
	
	//Transparency
	draw_set_alpha(0.8);
	if (selectedItem == i)
	{
		draw_sprite(sprInvBoxSelected, 0, itemX, itemY);
	}
	else
	{
		draw_sprite(sprInvBox, 0, itemX, itemY);
	}
	draw_set_alpha(1);
	
	if (ds_map_find_value(global.inventory, currItem) > -1)
	{
		switch(objName)
		{
			case "objBushBerryRed":
				draw_sprite(sprBerryRed, image_index, itemX, itemY);
				break;
			case "objBushBerryBlue":
				draw_sprite(sprBerryBlue, image_index, itemX, itemY);
				break;
			default:
				draw_sprite(object_get_sprite(currItem), image_index, itemX, itemY);
				break;
		}
		
		DrawSetText(fText, fa_left, fa_top, c_gray);
		draw_text(itemX + 2, itemY, ds_map_find_value(global.inventory, currItem));
	}
	currItem = ds_map_find_next(global.inventory, currItem);
}
#endregion