///@desc ItemPickupAndChangeObject(number, destroy, object)
///@arg number
///@arg destroy
///@arg object
function ItemPickupAndChangeObject(argument0, argument1, argument2) {

	ItemPickup(argument0, argument1);
	with (activate)
	{
		instance_change(argument2, true);
	}


}
