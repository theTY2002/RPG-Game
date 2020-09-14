///@desc CreateFloatText(text, colour)
///@arg text
///@arg colour
function CreateFloatText(argument0, argument1) {

	global.floatTextString = argument0;
	global.floatTextColour = argument1;

	instance_create_layer(x, y, "Instances", objFloatText);

	//show_debug_message("TEXT IS CREATED");


}
