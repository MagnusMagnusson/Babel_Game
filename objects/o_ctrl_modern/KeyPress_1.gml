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
			var b = instance_create_layer(i*64, yline,blockLayer,o_block);
			b.image_yscale = 0.5;
			b.image_xscale = 0.5;
		}
		state = states.playing;
		blockAlarm = 1;
		break;
	}
	case states.playing:{
		if(keyboard_check(vk_escape)){
			state = states.paused;
			exit;
		}
		var clap = false;
		var boom = false;
		with(o_block){
			if(!locked){
				var play = false;
				var block = instance_place(x,y + 64,o_block);
				if(block == noone || !block.locked){
					other.blocks--;
					boom = true;
					dead = true;
					vspeed = -20-random(20);
					hspeed = random(30) - 15;
					gravity = 2;
				} else{
					clap = true;
					with(other){
						rm_inc(1);
					}
				}
				locked = true;
			}
		}
		if(clap){
			audio_play_sound(snd_clap,1,false)
		}
		if(boom){
			audio_play_sound(snd_boom,1,false)
		}
		if(blocks > 0){
			sc_inc(1);
			difficulty += 1/5;
			next_level();
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
			blockAlarm = 1;
		}
		break;
	}
}
