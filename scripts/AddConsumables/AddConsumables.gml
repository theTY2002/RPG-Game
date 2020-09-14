/// @desc AddConsumables(type, number)
/// @arg type
/// @arg number
function AddConsumables(argument0, argument1) {
	//NewTextBox(argument[2], argument[3]);

	switch(argument0)
	{
		case "COIN":
			CreateFloatText("+" + string(argument1), c_yellow);
			global.coinNum += argument1;
	}

	instance_destroy();


}
