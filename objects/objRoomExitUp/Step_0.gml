/// @description Insert description here
// You can write your code in this editor
if (instance_exists(objPlayer)) && position_meeting(objPlayer.x, objPlayer.y, id)
{
	if (!instance_exists(objTransition))
	{
		global.targetRoom = targetRoom;
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDirection = objPlayer.direction;
		global.locationY--;
		with (objPlayer)
		{
			state = PlayerStateTransition;
		}
		RoomTransition(TRANS_TYPE.FADE, targetRoom);
		instance_destroy();	
	}	
}