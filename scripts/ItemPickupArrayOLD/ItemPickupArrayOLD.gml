function ItemPickupArrayOLD(argument0) {
	objName = object_get_name(activate.object_index);
	name = string_delete(objName, 1, 3);

	NewTextBox("You got " + string(argument0) + " " + name + "!", 3);

	number = argument0;

	//loop through inventory
	for (var i = 0; i < objInventory.maxInventorySize; i++)
	{
		if (global.inventory[i] == -1)
		{
			//Add item
			global.inventory[i] = activate;
		
			with (activate)
			{
				instance_destroy();
				break;
			}
		
		}
	}




}
