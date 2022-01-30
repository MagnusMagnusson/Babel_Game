if(keyboard_check(ord("M"))) exit;
switch(state){
	case states.gameOver:{
		if(keyboard_check(vk_escape)){
			room_goto(rm_main_menu);
		} else{
			reset();
			state = states.not_started;
			blockAlarm = 1;
			break;
		}
	}
	case states.not_started:{		
		for(var i = 0; i < blocks; i++){
			instance_create_layer(i*64*gm_scale, Yoffset + yline,blockLayer,o_block);
		}
		state = states.playing;
		blockAlarm = difficulty;
		break;
	}
	case states.playing:{
		if(keyboard_check(vk_escape)){
			state = states.paused;
			exit;
		}
		var hit = false;
		var boom = false;
		with(o_block){
			if(!locked){
				var play = false;
				var block = instance_place(x,y + 64*gm_scale,o_block);
				if(block == noone || !block.locked){
					other.blocks--;
					if(!play){
						boom = true;
						play = true;
					}
					dead = true;
					vspeed = -20-random(20);
					hspeed = random(30) - 15;
					gravity = 2;
				} else{
					hit = true;
					with(other){
						rm_inc(1);
					}
				}
				locked = true;
			}
		}
		if(hit){
			audio_play_sound(snd_clap,1,false);
		}
		if(boom){
			audio_play_sound(snd_boom,1,false);
		}
		if(blocks > 0){
			sc_inc(1);
			if(score % 5 == 0){
				state = states.moving_camera;
				movement = 10;
				paused = true;
				alarm[2] = 10;
				timer = min(timer + 5,100);
			} else{
				next_level();
			}
		} else{
			state = states.gameOver;
			game_over();
		}
		break;
	}
	case states.paused:{		
		if(keyboard_check(vk_escape)){
			room_goto(rm_main_menu);
		} else{
			state = states.playing;
		}
		break;
	}
}
