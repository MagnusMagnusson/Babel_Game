draw_set_font(fnt_big);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
if(mouse_x > x - 16 && mouse_x < x + string_width(text) + 16 && mouse_y > y - 16 && mouse_y < y + 16 + string_height(text)){
	action();
} 