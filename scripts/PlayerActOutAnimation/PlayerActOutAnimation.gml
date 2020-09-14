/// @desc PlayerActOutAnimation(sprite, endScript)
/// @arg sprite
/// @arg endScript
function PlayerActOutAnimation() {

	///Carry out an animation and an optional script when the animation ends

	state = PlayerStateAct;
	sprite_index = argument[0];
	if (argument_count > 1)
	{
		animationEndScript = argument[1];
	}
	localFrame = 0;
	image_index = 0;
	PlayerAnimateSprite();


}
