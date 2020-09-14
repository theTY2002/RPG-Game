/// @description Insert description here
// You can write your code in this editor
DrawSetText(fText, fa_center, fa_middle, c_red);
//draw_text(RESOLUTION_W / 2, 20, "GAME OVER");
draw_text_transformed(RESOLUTION_W / 2, 20, "GAME OVER", 2, 2, 0);

draw_set_color(c_white);
draw_sprite(sprPlayerDead, 0, RESOLUTION_W / 2, RESOLUTION_H / 2);