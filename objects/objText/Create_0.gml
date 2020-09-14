/// @description Insert description here
// You can write your code in this editor
//show_debug_message("NAME: " + object_get_name(self));
global.gamePaused = true;
objText.gamePausedImageSpeed = image_speed;

x1 = RESOLUTION_W * 3.5 / 5;
y1 = RESOLUTION_H - 70;
x2 = RESOLUTION_W * 3.5 / 5;
y2 = RESOLUTION_H;

x1Target = RESOLUTION_W * 2 / 5;
x2Target = RESOLUTION_W;

lerpProgress = 0;
textProgress = 0;

//message = "Default";
textTopBuffer = 8;
//background = 0;

responseSelected = 0;