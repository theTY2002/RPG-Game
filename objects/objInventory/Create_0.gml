/// @description Insert description here
// You can write your code in this editor

/*
enum ITEM_TYPES
{
	apple,
	mushroom
}

enum ITEM_STATS
{
	name
}
*/

maxInventorySize = 6;

global.inventory = ds_map_create();
showInventory = false;
disabled = false;

itemW = 16;
itemH = 16;

invX = (RESOLUTION_W / 2) - (itemW * 2.5);
invY = RESOLUTION_H - itemH;

drawX = 60;
drawY = 0;

selectedItem = 0;