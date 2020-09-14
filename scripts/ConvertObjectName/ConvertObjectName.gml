///@desc ConvertObjectName(object)
///@arg object
function ConvertObjectName(argument0) {

	var _name = "";
	switch(argument0)
	{
		case objMushroomRedS:
			_name = "Small Red Mushroom";
			break;
		case objBushBerryRed:
			_name = "Red Berry";
			break;
		case objBushBerryBlue:
			_name = "Blue Berry";
			break;
		default:
			_name = "ITEM NAME";
	}

	_name = string_upper(_name);

	return _name;


}
