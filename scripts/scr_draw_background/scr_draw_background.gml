function scr_draw_background(off){
	var backgrounds = [
		bg_grass1,
		bg_grass2,
		bg_mountain_1,
		bg_mountain_2,
		b_sun
	];
	
	var distances = [
		20,
		50,
		120,
		400,
		2000,
	];
	
	var offset = [
		room_height - 300,
		room_height - 450,
		room_height - 710,
		room_height - 500,
		-room_height / 2 + 90,
	];
	
	var cam = camera_get_active();
	var camY = off + camera_get_view_y(cam);
	
	for(var i = array_length(backgrounds) - 1; i >= 0; i--){
		var yoff = camY + off;
		var Y = offset[i] + camY - ((yoff + camY)/distances[i]);
		draw_sprite(backgrounds[i], 0, 0, Y);
	}
}