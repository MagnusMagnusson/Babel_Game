if(state == states.playing){
	if(score < 100){
		q = max(11 - (score / 26), 8.05);
	} 
	var cameraMoveSpeed = ceil(delta * room_speed  * (1/q)*room_height*(difficulty/room_width))
	var cam = view_camera[0];
	var camY = camera_get_view_y(cam);

	camera_set_view_pos(cam, 0, camY - cameraMoveSpeed);
	
	if(camY + room_height < yline){
		state = states.gameOver;
		game_over();
	}
}