/// @arg id
function ActivateLiftable(argument0) {
	if (global.iLifted == noone)
	{
		PlayerActOutAnimation(sprPlayerLift);
		global.iLifted = argument0;
		with (global.iLifted)
		{
			lifted = true;
			persistent = true;
		}
	}


}
