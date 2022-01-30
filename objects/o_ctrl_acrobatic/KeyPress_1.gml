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
		next_level();
		sc_reset();
		state = states.playing;
		blockAlarm = 1;
		break;
	}
	case states.playing:{
		if(keyboard_check(vk_escape)){
			state = states.paused;
			exit;
		}
		state = states.acroFall;
		with(o_block){
			if(!locked){
				gravity = 0.96;
			}
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
