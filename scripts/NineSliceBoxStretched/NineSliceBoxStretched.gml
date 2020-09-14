/// @arg sprite
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg index
function NineSliceBoxStretched(argument0, argument1, argument2, argument3, argument4, argument5) {

	var _size = sprite_get_width(argument0) / 3;
	var _x1 = argument1;
	var _y1 = argument2;
	var _x2 = argument3;
	var _y2 = argument4;
	var _index = argument5;
	var _w = _x2 - _x1;
	var _h = _y2 - _y1;

	//MIDDLE
	draw_sprite_part_ext(argument0, _index, _size, _size, 1, 1, _x1 + _size, _y1 + _size, _w - (_size * 2), _h - (_size * 2), c_white, 1);

	//CORNERS
	draw_sprite_part(argument0, _index, 0, 0, _size, _size, _x1, _y1);

	draw_sprite_part(argument0, _index, _size * 2, 0, _size, _size, _x1 + _w - _size, _y1);

	draw_sprite_part(argument0, _index, 0, _size * 2, _size, _size, _x1, _y1 + _h - _size);

	draw_sprite_part(argument0, _index, _size * 2, _size * 2, _size, _size, _x1 + _w - _size, _y1 + _h - _size);

	//EDGES
	draw_sprite_part_ext(argument0, _index, 0, _size, _size, 1, _x1, _y1 + _size, 1, _h - (_size * 2), c_white, 1);

	draw_sprite_part_ext(argument0, _index, _size * 2, _size, _size, 1, _x1 + _w - _size, _y1 + _size, 1, _h - (_size * 2), c_white, 1);

	draw_sprite_part_ext(argument0, _index, _size, 0, 1, _size, _x1 + _size, _y1, _w - (_size * 2), 1, c_white, 1);

	draw_sprite_part_ext(argument0, _index, _size, _size * 2, 1, _size, _x1 + _size, _y1 + _h - _size, _w - (_size * 2), 1, c_white, 1);


}
