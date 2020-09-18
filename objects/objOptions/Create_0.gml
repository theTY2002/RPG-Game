/// @description Insert description here
// You can write your code in this editor
page = 0;
pageSpriteWidth = sprite_get_width(sprPageBar);
drawYMiddle = RESOLUTION_H  / 2;
drawYBottom = RESOLUTION_H - 52;
drawYTop = 60;
drawXMiddle = RESOLUTION_W / 2;

enum PAGES
{
	MOVE,
	ROLL,
	INTERACT,
	INVENTORY
}

menuText[PAGES.MOVE] = "You can press either the WASD keys or \n the arrow keys to move the player.";
menuText[PAGES.ROLL] = "When you are not facing an interactable \n object, you can press SPACE to roll."
menuText[PAGES.INTERACT] = "When you are facing an item or an NPC, \n you can press SPACE to interact."
menuText[PAGES.INVENTORY] = "When your inventory is not empty, \n you can press E to open it."

pages = array_length(menuText);


moveShadow = part_system_create();
part_system_depth(moveShadow, 5000);

playerShadow = part_type_create();

part_type_sprite(playerShadow, sprControlsPlayerRun, 1, 0, 0);
part_type_size(playerShadow, 1, 1, 0, 0);

part_type_life(playerShadow, 20, 20);
part_type_alpha3(playerShadow, 0.5, 0.30, 0.1);
part_type_color1(playerShadow, c_white);

fadeTime = 0;
fadeTimeDuration = 8;