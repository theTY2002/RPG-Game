/// @description Insert description here
// You can write your code in this editor

//Health
draw_sprite_part(sprBarShadow, 0, 0, 0, barWidth, barHeight, drawX + 1, drawY + 1);

//Red Bar
draw_sprite_part(sprRedBar, 0, 0, 0, barWidth, barHeight, drawX, drawY);

//Yellow Bar
draw_sprite_part(sprYellowBar, 0, 0, 0, barWidth * xScaleYellow, barHeight, drawX, drawY);

//Green Bar
draw_sprite_part(sprGreenBar, 0, 0, 0, barWidth * xScaleGreen, barHeight, drawX, drawY);

//Mana
draw_sprite_part(sprBarShadow, 0, 0, 0, barWidth, barHeight, drawX + 1, drawY + barHeight + 1);

//Purple Bar
draw_sprite_part(sprPurpleBar, 0, 0, 0, barWidth, barHeight, drawX, drawY + barHeight);
//Cyan Bar
draw_sprite_part(sprCyanBar, 0, 0, 0, barWidth * xScaleCyan, barHeight, drawX, drawY + barHeight);
//Blue Bar
draw_sprite_part(sprBlueBar, 0, 0, 0, barWidth * xScaleBlue, barHeight, drawX, drawY + barHeight);

//Numbers
//DrawSetText(fBattle, fa_left, fa_bottom, c_white);
//draw_text(xx + barWidth, yy + (barHeight / 2), string(hpTemp));