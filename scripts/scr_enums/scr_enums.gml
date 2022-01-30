enum states{
	not_started,
	playing,
	moving_camera,
	paused,
	gameOver,
	acroFall
}

#macro gm_scale 2
#macro Yoffset 64
#macro delta delta_time / 1000000

global.first = true;