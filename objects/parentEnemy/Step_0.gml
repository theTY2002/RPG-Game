/// @description Execute State Machine
// You can write your code in this editor
if (!global.gamePaused)
{
	if (enemyScript[state] != -1)
	{
		script_execute(enemyScript[state]);
	}
	depth = -bbox_bottom;
}

if (room == rmBattle)
{
	id.visible = false;
}
else
{
	id.visible = true;
}