/// @description Update camera
// You can write your code in this editor

if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}
else
{
	xTo = RESOLUTION_W / 2;
	yTo = RESOLUTION_H / 2;
}

//Update camera position
x += (xTo - x) / 15;
y += (yTo - y) / 15;

//Keep camera centre inside room
x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);

//Screenshake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1 / shakeLength) * shakeMagnitude));

camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);