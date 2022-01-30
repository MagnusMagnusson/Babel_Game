if(room != rm_name){
	if(!audio_is_paused(snd_mythos)){
		audio_pause_sound(snd_mythos);
	} else{
		audio_resume_sound(snd_mythos);
	}
}