///@desc ConvertItemName(objName)
///@arg objName
function ConvertItemName(argument0) {

	var _name = "";
	switch(argument0)
	{
		case "objMushroomRedS":
			_name = "Small Red Mushroom";
			break;
		case "objBushBerryRed":
			_name = "Red Berry";
			break;
		case "objBushBerryBlue":
			_name = "Blue Berry";
			break;
		default:
			_name = "ITEM NAME";
	}
	return _name;


}
