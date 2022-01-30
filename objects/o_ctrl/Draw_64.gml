draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var cam = view_camera[0];

switch(state){
	case states.not_started: {
		draw_set_font(fnt_big)
		draw_text(camera_get_view_width(cam) / 2, room_height * 0.25, @"Press Any Key To Start");
		break;
	}
	
	case states.moving_camera : {
	}
	
	case states.acroFall:
	case states.playing : {
		draw_set_font(fnt_big)
		draw_text(camera_get_view_width(cam) / 2,64,"Floor "+ string(score));
		draw_set_font(fnt_med)
		draw_text(camera_get_view_width(cam) / 2,64 * 2, string(rooms) + " Rooms");
		if(timer > 0){
			draw_text(camera_get_view_width(cam) / 2,64 * 3, timer);
		}
		break;
	}	
	
	case states.gameOver: {
		draw_set_font(fnt_big)
		draw_text(camera_get_view_width(cam) / 2, room_height * 0.25, @"Leik Lokið");
		draw_set_font(fnt_med)
		draw_text(camera_get_view_width(cam) / 2, room_height *0.25 + 64,@"UThixo uyibethile inqaba yakho 
		" + string(score) + " papa," +string(rooms)+ " ruuma");
		draw_text(camera_get_view_width(cam) / 2, room_height *0.25 + 256,@"Appuyez sur n'importe quelle touche pour jouer à nouveau ");
		draw_set_font(fnt_med)
		draw_text(camera_get_view_width(cam) / 2, room_height *0.25 + 256 + 64,@"(You lost. Press any key to restart, or escape for main menu)");
		break;
	}
	
	case states.paused: {
		draw_set_font(fnt_big)
		draw_text(camera_get_view_width(cam) / 2, 64, @"The game is paused");
		draw_set_font(fnt_med)
		draw_text(camera_get_view_width(cam) / 2, 64 * 2, @"Press any key to continue");
		draw_text(camera_get_view_width(cam) / 2,64 * 3, @"Press escape for the main menu");
	}
}
