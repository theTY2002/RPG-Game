/// @description Insert description here
// You can write your code in this editor
if (room != rmCave)
{
	draw_sprite(sprShadow, 0, floor(x), floor(y));
}

if (global.iFrame >= 0)
{
	image_alpha = 1;
	
	if(floor(current_time / 100) % 2 == 0)
	{
		image_alpha = 0.5;
	}
}
else
{
	image_alpha = 1;
}

//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);

draw_sprite_ext(sprite_index, image_index, floor(x), floor(y - z), image_xscale, image_yscale, image_angle, image_blend, image_alpha);