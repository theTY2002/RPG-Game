///@desc InventoryDropItem(item)
///@arg item
function InventoryDropItem(argument0) {

	item = argument0;

	if (ds_map_exists(global.inventory, item))
	{
		instance_create_layer(objPlayer.x, objPlayer.y, "Instances", item);
		value = ds_map_find_value(global.inventory, item);
		ds_map_replace(global.inventory, item, value - 1);
		//ds_map_delete(global.inventory, item);
	}


}
