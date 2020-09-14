function ChangeSprite() {
	switch(activate.object_index)
	{
		case objCampfire:
			with (activate)
			{
				on = !on;
				break;
			}
		default:
			break;
	}


}
