/// @description Progress Transition
// You can write your code in this editor
global.iFrame = 1;
with (objPlayer)
{
	state = PlayerStateTransition;
}

if (leading == OUT)
{
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1)
	{
		room_goto(target);
		leading = IN;
	}
}
else //leading == IN
{
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0)
	{
		with (objPlayer)
		{
			state = PlayerStateFree;
		}
		instance_destroy();
	}
}