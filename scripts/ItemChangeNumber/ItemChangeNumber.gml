///@desc ItemChangeNumber(item, number)
///@arg item
///@arg number
function ItemChangeNumber(argument0, argument1) {

	if (!ds_map_size(global.inventory) <= objInventory.maxInventorySize)
	{
		var _key = argument0;
		var _value = argument1;

		if (ds_map_exists(global.inventory, _key))
		{
			_value += ds_map_find_value(global.inventory, _key);
			if (_value <= 0)
			{
				ds_map_delete(global.inventory, _key);
			}
			else
			{
				ds_map_replace(global.inventory, _key, _value);
			}
		}
		else
		{
			ds_map_add(global.inventory, _key, _value);
		}
	}
	else
	{
		NewTextBox("Your inventory is full!", 3);
	}


	//show_message("Key: " + string(_key) + ", Value: " + string(ds_map_find_value(objPlayer.inventory, _key)));


}
