/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < array_length(global.enemiesDefeated); i++)
{
	global.enemiesDefeated[i] = -1;
}

global.gameOver = false;

RoomTransition(TRANS_TYPE.FADE, ROOM_START);