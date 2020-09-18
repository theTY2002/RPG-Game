function Macros() {
	//Game Setup
#macro FRAME_RATE 60
#macro TILE_SIZE 16
#macro CARDINAL_DIR round(direction / 90)
#macro ROOM_START rmMenu
	//Screen Setup
#macro RESOLUTION_W 320
#macro RESOLUTION_H 180
	//Room Transitions
#macro TRANSITION_SPEED 0.02
#macro OUT 0
#macro IN 1

#macro LIFTED_Z 15
	//Minimap Setup
#macro MAP_FILENAME "Map.txt"
#macro START_LOCATION_X 2
#macro START_LOCATION_Y 2

enum MAPSTATES
{
	WALL,
	HIDDEN,
	DISCOVERED
}

enum ICONSTATES
{
	EMPTY,
	PLAYER,
	COIN
}


enum ENEMYSTATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT
}

#macro SLIMEGREENCOLOUR make_color_rgb(132, 240, 200)
#macro SLIMEBLUECOLOUR make_color_rgb(132, 189, 240)
#macro SLIMEYELLOWCOLOUR make_color_rgb(255, 244, 53)

}
