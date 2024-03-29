/// @description Insert description here
// You can write your code in this editor

//Player Input
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));
keyActivate = keyboard_check_pressed(vk_space);
keyAttack = keyboard_check_pressed(vk_shift);
keyItem = keyboard_check_pressed(vk_control);

inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);

global.currentRoom = room;
global.playerX = x;
global.playerY = y;

if (global.iLifted != noone)
{
	spriteIdle = sprPlayerCarry;
	spriteRun = sprPlayerRunCarry;
}
else
{
	spriteIdle = sprPlayer;
	spriteRun = sprPlayerRun;
}

//Execute State
if (!global.gamePaused)
{
	script_execute(state);
}

depth = -bbox_bottom;
show_debug_message("DEPTH: " + string(depth));


show_debug_message("X: " + string(x));
show_debug_message("BBOX RIGHT: " + string(bbox_right));
show_debug_message("BBOX LEFT: " + string(bbox_left));

global.iFrame--;