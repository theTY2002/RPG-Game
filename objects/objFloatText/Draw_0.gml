/// @description Insert description here
// You can write your code in this editor
y -= 0.1;
textAlpha = max(textAlpha - 0.01, 0);

DrawSetText(fCoin, fa_center, fa_center, colour);
draw_text_color(x, y - 16, text, colour, colour, colour, colour, textAlpha);
//draw_text(x, y, text);

if (textAlpha <= 0)
{
	instance_destroy();
}