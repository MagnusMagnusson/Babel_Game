if(blockAlarm > -100 && blockAlarm <= 0){
	blockAlarm = -100;
	if(state == states.playing){
		with(o_block){
			if(!locked){
				if(x <= 0){
					other.dir = 1;
				}
				if(x >= room_width -  128){
					other.dir = -1;
				}
			}
		}
		with(o_block){
			if(!locked){
				x += 64 * other.dir*gm_scale;
			}
		}
	
		blockAlarm = difficulty;
	}
} else if(blockAlarm >= 0){
	blockAlarm -= room_speed * delta;
}