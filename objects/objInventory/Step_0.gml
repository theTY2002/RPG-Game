/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(objTransition))
{
	//Toggle inventory
	if (ds_map_size(global.inventory) != 0)
	{
		if (keyboard_check_pressed(ord("E")))
		{
			global.gamePaused = !global.gamePaused;
			showInventory = !showInventory;
			disabled = showInventory;
	
			with (objPlayer)
			{
				if (other.disabled)
				{
					if (state != PlayerStateLocked)
					{
						lastState = state;
						state = PlayerStateLocked;
					}
				}
				else
				{
					state = lastState;
				}
			}
		}
	}


	//Delete non-existent items from inventory
	currItem = ds_map_find_first(global.inventory);
	for (var i = 0; i < ds_map_size(global.inventory); i++)
	{
		if (ds_map_find_value(global.inventory, currItem) == 0)
		{
			ds_map_delete(global.inventory, currItem);
		}
		currItem = ds_map_find_next(global.inventory, currItem);
	}

	// Cycle through inventory
	if (showInventory)
	{
		if (keyboard_check_pressed(ord("D")))
		{
			if ((selectedItem + 1) <= (ds_map_size(global.inventory) - 1))
			{
				selectedItem++;
			}
			else
			{
				//show_debug_message("HELLO");
				selectedItem = 0;
			}
		}

		if (keyboard_check_pressed(ord("A")))
		{
			if ((selectedItem - 1) >= 0)
			{
				selectedItem--;
			}
			else
			{
				selectedItem = ds_map_size(global.inventory) - 1;
			}
		}
	}

	/*
	#region
	//Drop Item
	if (showInventory)
	{
		if (keyboard_check_pressed(ord("Q")))
		{
			currItem = ds_map_find_first(global.inventory);
			for (var i = 0; i < ds_map_size(global.inventory); i++)
			{
				if (selectedItem == i)
				{
					item = currItem;
				}
				currItem = ds_map_find_next(global.inventory, currItem);
			}
			InventoryDropItem(item);
		}
	}
	#endregion
	*/
}