alarm[1] = 1;
alarm[3] = 3;
alarm[4] = room_speed;

highLimit = 5;
rm_reset();
mode = "classic"
blockLayer = layer_get_id("Instances");
bottomLine = room_height + 2;
next_level = function(){	
	state = states.playing;
	yline -= 64 * gm_scale;
	if(score%2 == 0){
		for(var i = 0; i < blocks; i++){
			dir = 1;
			instance_create_layer((1+i)*64*gm_scale, Yoffset + yline,blockLayer,o_block);
		}
	} else{
		for(var i = 0; i < blocks; i++){
			dir = -1;
			instance_create_layer(room_width - (1+i)*64*gm_scale, Yoffset + yline,blockLayer,o_block);
		}
	}
	blockAlarm = difficulty;
}

set_bg_color = function(col){
	layer_background_blend(layer_background_get_id(layer_get_id("il_background")), col);
}

l = 0;
reset = function(){
	l = 0;
	difficulty = 15;
	blocks = 5;
	dir = 1;
	timer = 30;
	yline = 6*64*gm_scale;
	bcol = make_color_rgb(81, 190, 225);
	bgColor(l);
	sc_reset()
	rm_reset();
	var cam = view_camera[0];
	camera_set_view_pos(cam, 0, 0);
	blockAlarm = -1;
}


bgColor = function(l){
	var r,g,b;
	r = color_get_red(bcol);
	g = color_get_green(bcol);
	b = color_get_blue(bcol);

	if(l < 5){
		b -= 30;
		g -= 20;
		r += 20;
	} else{
		b = max(0,b - 8);
		g = max(0,g - 8);
		r = max(0,r - 20);
	}
	
	bcol = make_color_rgb(r,g,b);
	set_bg_color(bcol);
}

reset();
state = states.not_started;

game_over = function(){
	audio_play_sound(snd_boom,1,false);
	with(o_block){
		if(!first){
			locked = false;
			vspeed = -20 - random(10)*gm_scale;
			hspeed = 15 - random(30)*gm_scale;
			gravity = 2;
		}
	}
	if(score >= highLimit){
		if(!is_undefined(global.username)){
			sc_v();
			rm_v();
			highscore_submit(global.username, score, rooms, global.uid, mode);
		}
	}
}


