/// @description Insert description here
// You can write your code in this editor
/*
if (state != "NO BATTLE")
{
	draw_text(10, 10, "BATTLE IS STARTING");
}
*/

if (state == "READY")
{
	draw_sprite(sprWaterBackground, 0, 0, 0);
	
	DrawSetText(fText, fa_right, fa_top, c_black);
	var BUFFER = 8;
	
	
	textX = RESOLUTION_W / 2;
	textY = RESOLUTION_H;
	
	DrawSetText(fText, fa_center, fa_middle, c_black);
	
	draw_rectangle(0, textY, textX, textY - 64, false);
	
	draw_set_colour(c_white);
	draw_text(textX, textY - ((font_get_size(fText) + BUFFER) / 2), visibleString);
	
	
	
	DrawSetText(fText, fa_left, fa_top, c_white);
	
	xx = RESOLUTION_W - string_width("HP: 999 / 999");
	
	draw_text(xx, BUFFER, "HP: " + string(hero.hp) + " / " + string(hero.hpMax));
	draw_text(xx, BUFFER * 2 + font_get_size(fText), "MP: " + string(hero.mp) + " / " + string(hero.mpMax));
	
	
}