/// @desc RoomTransition(type, targetroom) 
/// @arg Type
/// @arg TargetRoom
function RoomTransition() {

	if (!instance_exists(objTransition))
	{
		with (instance_create_depth(0, 0, -9999, objTransition))
		{
			type = argument[0];
			target = argument[1];
		}
	}


}
