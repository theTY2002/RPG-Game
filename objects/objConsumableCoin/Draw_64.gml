/// @description Insert description here
// You can write your code in this editor

if (!coinDrawn)
{
	draw_sprite_ext(
	sprConsumableCoin,
	image_index / invertSpeed,
	RESOLUTION_W - pixelsFromRight - string_width("x " + string(global.coinNum)) + 2,
	20,
	1,
	1,
	0,
	c_black,
	1);
	
	draw_sprite_ext(
	sprConsumableCoin,
	image_index / invertSpeed,
	RESOLUTION_W - pixelsFromRight - string_width("x " + string(global.coinNum)),
	18,
	1,
	1,
	0,
	c_white,
	1);
	
	DrawSetText(fCoin, fa_right, fa_top, c_black);
	draw_text_transformed(RESOLUTION_W - 15, 11, "x " + string(global.coinNum), 1, 1, 0);

	DrawSetText(fCoin, fa_right, fa_top, c_yellow);
	draw_text_transformed(RESOLUTION_W - 16, 10, "x " + string(global.coinNum), 1, 1, 0);
	
	coinDrawn = true;
}

coinDrawn = false;