if(movement <= 0){
	paused = false;
	if(difficulty <= 6){
		difficulty = max(difficulty - 0.5, 1);
	} else if(difficulty <= 10){
		difficulty = max(difficulty - 1, 1);
	}else {
		difficulty = max(difficulty - 2, 1);
	}
	l++;
	bgColor(l);
	next_level();
} else{
	movement--;
	alarm[2] = 10;
	var cam = view_camera[0];
	camera_set_view_pos(cam, 0, camera_get_view_y(cam) - 32 * gm_scale);
}