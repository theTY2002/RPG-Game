/// @description Insert description here
// You can write your code in this editor
x--;
//image_blend = c_aqua;

image_alpha -= 0.025;
if (image_alpha <= 0)
{
	instance_destroy();
}

if (!instance_exists(objOptions))
{
	instance_destroy();
}