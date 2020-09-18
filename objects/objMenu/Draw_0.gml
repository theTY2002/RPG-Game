/// @description Insert description here
// You can write your code in this editor

DrawSetText(fMenu, fa_center, fa_middle, c_black);
draw_text_transformed(titleX + 1, titleY + 1, "Hat Quest", titleZ, titleZ, 0);
//draw_text(titleX + 1, titleY + 1, "Hat Quest");
DrawSetText(fMenu, fa_center, fa_middle, c_yellow);
//draw_text(titleX, titleY, "Hat Quest");
draw_text_transformed(titleX, titleY, "Hat Quest", titleZ, titleZ, 0);


for (var i = 0; i < buttonNumber; i++)
{	
	xx = menuX;
	yy = menuY + (buttonHeight + buttonPadding) * i + 256 * (1 - unfold[i]);
	
	//draw_set_color(c_dkgray);
	//draw_rectangle(xx - buttonWidth / 2, yy, xx - buttonWidth / 2 + buttonWidth, yy + buttonHeight, false);
	
	DrawSetText(fMenu, fa_center, fa_middle, c_dkgray);
	if (menuIndex == i)
	{
		draw_set_color(c_aqua);
	}
	
	draw_text(xx, yy + buttonHeight / 2 + 1, buttons[i]);
}