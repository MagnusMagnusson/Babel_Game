if(state == states.playing){
	with(o_block){
		if(!locked){
			if(x <= 0){
				other.dir = 1;
			}
			if(x >= room_width){
				other.dir = -1;
			}
		}
	}
	with(o_block){
		if(!locked){
			x +=  other.difficulty * other.dir  * delta * room_speed;
		}
	}
	
	blockAlarm = 1;
}