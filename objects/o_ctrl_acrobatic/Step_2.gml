if(state == states.playing || state == states.acroFall){
	var deadBlock = false;
	with(o_block){
		if(!locked && !dead){
			var cam = view_camera[0];
			var camY = camera_get_view_y(cam);
			if(y > camY + room_height - 128){
				direction = random_range(0,180);
				speed = random_range(10,15);
				gravity = 0.5;
				dead = true;
				deadBlock = true;
			}
			if(x <= 64){
				other.dir = 1;
			}
			if(x >= room_width - 2*64){
				other.dir = -1;
			}
			x +=  other.difficulty * other.dir;
		}
	}
	
	if(state == states.acroFall){
		var hit = false;
		blocks = 0;
		with(o_block){
			if(!locked && !dead){
				var b = instance_place(x, y + vspeed, o_block);
				if(b && b.y > y && b.locked){
					var val = true;
					with(o_block){
						if(locked && !temp){
							if(y <= b.y - 64){
								val = false;
							}
						}
					}
					if(val){
						hit = true;
						temp = true;
						var diff = abs(b.y - (y - 64))/vspeed;
						y = b.y - 64;
						x += hspeed * diff;
						speed = 0;
						gravity = 0;	
						other.blocks++;
						with(other){
							rm_inc(1);
						}
					} else{
						direction = random_range(0,180);
						speed = random_range(5,10);
						speed = random_range(10,15);
						gravity = 0.5;
						dead = true;
						deadBlock = true;
					}
				} 
			}
		}
		with(o_block){
			if(temp){
				temp = false;
				locked = true;
			}
		}
		if(hit){
			audio_play_sound(snd_clap,1,false);
			next_level();
		}
	}
	if(deadBlock){
		audio_play_sound(snd_boom,1,false);
		if(blocks == 0){
			state = states.gameOver;
			game_over();
		}
	}
	blockAlarm = 1;
}