// Inherit the parent event
event_inherited();
timer = -1;
mode = "modern";
reset = function(){
	l = 0;
	difficulty = 10;
	blocks = 9
	dir = 1;
	yline = 9*64;
	bcol = make_color_rgb(81, 190, 225);
	bgColor(l);
	sc_reset();
	rm_reset();
	var cam = view_camera[0];
	camera_set_view_pos(cam, 0, 0);
}

next_level = function(){	
	state = states.playing;
	yline -= 64;
	if(score%2 == 0){
		for(var i = 0; i < blocks; i++){
			dir = 1;
			var b = instance_create_layer((1+i)*64,  yline,blockLayer,o_block);
			b.image_xscale = 0.5;
			b.image_yscale = 0.5;
		}
	} else{
		for(var i = 0; i < blocks; i++){
			dir = -1;
			var b = instance_create_layer(room_width - (1+i)*64, yline,blockLayer,o_block);
			b.image_yscale = 0.5;
			b.image_xscale = 0.5;
		}
	}
	blockAlarm = difficulty;
}

reset();