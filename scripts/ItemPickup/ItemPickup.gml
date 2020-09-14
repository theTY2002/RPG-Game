///@desc ItemPickup(number, destroy)
///@arg number
///@arg destroy
function ItemPickup(argument0, argument1) {

	if (!ds_map_size(global.inventory) <= objInventory.maxInventorySize)
	{
		objName = object_get_name(activate.object_index);

		name = ConvertItemName(objName);

		NewTextBox("You got " + string(argument0) + " " + name + "!", 3);

		var _key = activate.object_index;
		var _value = argument0;

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


		if (argument1)
		{
			with (activate)
			{
				instance_destroy();
			}
		}
	}
	else
	{
		NewTextBox("Your inventory is full!", 3);
	}


	//show_message("Key: " + string(_key) + ", Value: " + string(ds_map_find_value(objPlayer.inventory, _key)));


}
