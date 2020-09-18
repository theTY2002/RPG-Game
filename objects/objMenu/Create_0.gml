/// @description Insert description here
// You can write your code in this editor
titleX = RESOLUTION_W / 2;
titleY = 25;
titleZ = 6;
shake = false;

//titleXTo = ;
//titleYTo = 30;
titleZTo = 1.5;

menuX = RESOLUTION_W / 2;
menuY = RESOLUTION_H / 2 - 20;
buttonHeight = 16;
buttonWidth = 80;
buttonPadding = 8;

enum MENUOPTIONS
{
	NEWGAME,
	OPTIONS,
	EXIT
}

//Buttons
buttons[MENUOPTIONS.NEWGAME] = "New Game";
buttons[MENUOPTIONS.OPTIONS] = "Options";
buttons[MENUOPTIONS.EXIT] = "Exit";
buttonNumber = array_length(buttons);

menuIndex = 0;
lastSelected = 0;

for (var i = 0; i < buttonNumber; i++)
{
	unfold[i] = 0;
}

particleEffects = part_system_create();
part_system_depth(particleEffects, -1000);
//Create particle
boxFlash = part_type_create();
part_type_shape(boxFlash, pt_shape_line);
part_type_size(boxFlash, 2, 2, -0.02, 0);
part_type_color3(boxFlash, make_color_rgb(128, 255, 0), make_color_rgb(0, 128, 255), make_color_rgb(128, 255, 0));
part_type_alpha3(boxFlash, 0.3, 0.5, 0);
part_type_blend(boxFlash, true);
part_type_life(boxFlash, 20, 20);


optionExists = false;