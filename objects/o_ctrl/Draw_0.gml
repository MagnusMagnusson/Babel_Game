draw_set_font(fnt_small)
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if(instance_exists(o_network)){
	draw_set_font(fa_middle);
	draw_set_color(c_white);
	draw_text(32,128,"Tallest Towers of All Time");
	var scores = o_network.scores[$mode].ta;
	var s = min(array_length(scores),30);
	for(var i = 0; i < s; i++){
		if(scores[i].uid == "X"){
			break;
		}
		if(scores[i].uid == global.uid){
			draw_set_color(c_red);
		} else{
			draw_set_color(c_white);
		}
		draw_text(32, 128 + string_height("A")*(i+1),
			string(i+1)+". " + 
			string(scores[i].h) + " Floors, "+ 
			scores[i].u);
	}
	
	if(state == states.playing || state == states.acroFall){
		var str;
		for(var i = max(10,score - 15);  i <= score + 15; i++){
			str[i] = "";
		}
		for(var i = 0; i < s; i++){
			var u = scores[i];
			if(is_undefined(u.h)){
				continue;
			}
			var h = floor(u.h);
			if(h >=  max(10,score - 15) && h <= score + 15){
				ex = str[h]
				if(str[h] != ""){
					str[h] += ", ";
				}
				str[h] += u.u; 
			}
		}	
		var scale = o_block.image_xscale * sprite_get_width(Sprite1);
				draw_set_color(c_white);
		for(var i = max(10,score - 15);  i <= score + 15;i++){
			if(str[i] != ""){
				draw_line(0,bottomLine- scale * i, room_width, bottomLine-scale * i);
				draw_text( room_width / 2 + 128, bottomLine -  scale * i - string_height("A"), string(i)+". " + str[i]);
			}
		}
	}
	var longest = string_width("Roomiest towers of all time");
	for(var i = 0; i < s; i++){
		longest = max(longest, string_width(
			string(i+1)+". " + 
			string(scores[i].r) + " Rooms, "+ 
			scores[i].u));
	}
	
	draw_set_halign(fa_left);	
	draw_set_color(c_white);
	draw_text(room_width - 32 - longest,128,"Roomiest Towers of All Time");
	var scores = o_network.scores[$mode].wa;
	var s = min(array_length(scores),30);
	
	for(var i = 0; i < s; i++){
		if(scores[i].uid == "X"){
			break;
		}
		if(scores[i].uid == global.uid){
			draw_set_color(c_red);
		} else{
			draw_set_color(c_white);
		}
		draw_text(room_width - 32 -longest, 128 + string_height("A")*(i+1),
			string(i+1)+". " + 
			string(scores[i].r) + " Rooms, "+ 
			scores[i].u
		);
	}
	
	
	draw_set_halign(fa_left)	
}