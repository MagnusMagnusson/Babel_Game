if(state == states.playing){
	timer -= delta;
	if(floor(timer) != floor(timer + 1/room_speed)){
		if(timer < 10){
			audio_play_sound(snd_alarm,1,false);
		}
	}
	if(timer < 0){
		state = states.gameOver;
		game_over();
	}
}