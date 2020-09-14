/// @description Insert description here
// You can write your code in this editor
global.mouseX = device_mouse_x_to_gui(0);
global.mouseY = device_mouse_y_to_gui(0);

if (mouse_check_button(mb_left))
{
	cursor_sprite = sprCursorClick;
}
else
{
	cursor_sprite = sprCursor;
}

global.keyLeft =  (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")));
global.keyRight = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
global.keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
global.keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

global.keyActivate = keyboard_check_pressed(vk_space);

global.keyActivate = keyboard_check_pressed(vk_backspace);


show_debug_message(string(global.iLifted));

//if (layer_exists(""))