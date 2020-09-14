function AttackSlash() {

	//Attack just started
	if (sprite_index != sprPlayerAttackSlash)
	{
		//Set up correct animation
		sprite_index = sprPlayerAttackSlash;
		localFrame = 0;
		image_index = 0;
	
		//Clear hit list
		if (!ds_exists(hitByAttack, ds_type_list))
		{
			hitByAttack = ds_list_create();
		}
		ds_list_clear(hitByAttack);
	}

	CalcAttack(sprPlayerAttackSlashHB);

	//Update Sprite
	PlayerAnimateSprite();

	if (animationEnd)
	{
		state = PlayerStateFree;
		animationEnd = false;
	}


}
