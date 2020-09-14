/// @description Insert description here
// You can write your code in this editor
if (global.battle)
{
	visible = false;
}
else
{
	visible = true;
}


if (entityShadow)
{
	draw_sprite(sprShadow, 0, floor(x), floor(y));
}

if (flash != 0)
{
	shader_set(shWhiteFlash);
	shader_set_uniform_f(uFlash, flash);
}

draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y - z),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha);
	
if (shader_current() != -1)
{
	shader_reset();
}

//Make entity transparent
if (collision_ellipse(bbox_left - sprite_width / 4, bbox_top - sprite_width / 4, bbox_right + sprite_width / 4, bbox_bottom + sprite_width / 4, objPlayer, true, true)) && (entityTransparency) && (depth < objPlayer.depth)
{
	image_alpha = max(0.5, image_alpha - 0.02);
}
else
{
	image_alpha = min(1, image_alpha + 0.02);
}