draw_set_font(fnt_big);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
if(mouse_x > x - 16 && mouse_x < x + string_width(text) + 16 && mouse_y > y - 8 && mouse_y < y + 8 + string_height(text)){
	draw_set_color(c_red);
} else{
	draw_set_color(c_white);
}
draw_text(x,y,text);