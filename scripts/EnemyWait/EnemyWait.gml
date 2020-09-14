// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyWait(){
	sprite_index = sprWait;
	image_speed = 0;
	if (++stateWait >= stateWaitDuration)
	{
		stateWait = 0;
		state = stateTarget;
		image_speed = 1;
	}
}