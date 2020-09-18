/// @description Insert description here
// You can write your code in this editor
NineSliceBoxStretched(sprTextBoxBg, 5, 5, RESOLUTION_W - 5, RESOLUTION_H - 5, 3);

for (var i = 0; i < pages; i++)
{
	if (i == page)
	{
		draw_sprite(sprPageBar, 1, (RESOLUTION_W / 2 - pageSpriteWidth * (pages / 2)) + pageSpriteWidth * i, RESOLUTION_H - 25);
	}
	else
	{
		draw_sprite(sprPageBar, 0, (RESOLUTION_W / 2 - pageSpriteWidth * (pages / 2)) + pageSpriteWidth * i, RESOLUTION_H - 25);
	}
}

switch(page)
{
	case PAGES.MOVE:
		draw_sprite(sprControlsPlayerRun, image_index / 6, drawXMiddle, drawYTop);
		draw_sprite(sprControlsWASD, 0, drawXMiddle - 60, drawYMiddle);
		DrawSetText(fMenu, fa_center, fa_middle, c_black);
		draw_text(drawXMiddle, drawYMiddle, "or");
		draw_sprite(sprControlsArrowKeys, 0, drawXMiddle + 60, drawYMiddle);
		break;
	case PAGES.ROLL:
		draw_sprite(sprControlsPlayerRoll, image_index / 6, drawXMiddle, drawYTop);
		draw_sprite_ext(sprControlsSpaceBar, 0, drawXMiddle, drawYMiddle, 0.75, 0.75, 0, c_white, 1);
		break;
	case PAGES.INTERACT:
		draw_sprite(sprControlsSign, 0, drawXMiddle, drawYTop - 5);
		draw_sprite_ext(sprControlsPlayerInteract, 0, drawXMiddle, drawYTop + 5, 1, 1, 0, c_white, 0.6);
		break;
	case PAGES.INVENTORY:
		draw_sprite(sprInvBox, 0, drawXMiddle - sprite_get_width(sprInvBox) / 2, drawYTop);
		draw_sprite(sprInvBox, 0, drawXMiddle + sprite_get_width(sprInvBox) / 2, drawYTop);
		draw_sprite(sprMushroomRedS, 0, drawXMiddle - sprite_get_width(sprInvBox) / 2, drawYTop);
		break;
}

DrawSetText(fMenuSmall, fa_center, fa_middle, c_black);
draw_text(drawXMiddle, drawYBottom, menuText[page]);