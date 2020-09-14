function StartBattle() {
	//TODO: Pass in variables
	if (!instance_exists(objBattle))
	{
		instance_create_layer(x, y, "Instances", objBattle);
	}
	//show_debug_message("BATTLE");


}
