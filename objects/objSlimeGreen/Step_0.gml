/// @description Insert description here
// You can write your code in this editor
if (!global.gamePaused)
{
	if (enemyScript[state] != -1)
	{
		show_debug_message("STATE: " + string(state));
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