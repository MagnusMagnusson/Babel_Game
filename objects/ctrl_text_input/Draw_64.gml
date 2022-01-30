//SET TEXT COLOR
draw_set_color(c_white);

//font
draw_set_font(fnt_med);

//THe special start character
var console_start = ">";	

draw_text(x, y, console_start); //draw our text that which we type

//THe diffrance in length because of our start character
var console_line_diff = string_width(console_start);
//because the special start character is just 1 letter
//the x of drawing the | is just 10 but is able to be manipulated if we wanted diffrent start characters

var _color = input_string_color;

draw_text(
	//x+(console_line_diff*10), 
	x+(console_line_diff),
	y - 10 - string_height("A name"), 
	"Please enter your name, then press enter"
);

//THE STRING WE ARE CURRENTLY TYPING

draw_text_color(
	//x+(console_line_diff*10), 
	x+(console_line_diff),
	y, 
	input_text,
	_color,_color,_color,_color,
	1
);

//the line that does the blinking
if (input_line_blink = true){
	if (string_width(input_text) != 0){
		//length  = our current location in the string * the amount of pixels a single character takes up
		var length = ( string_width( string_copy(input_text,1,input_text_location) ) );
		//height is the length of the text we type
		var height = string_height(input_text);
		
		//draw_line( x of the start of the console output + how long our string is + the start characters * 10 )
		draw_line(x+length+(console_line_diff), y, x+length+(console_line_diff), y+height);
		
	} else {
		//if nothing is typed here is our default state for the |
		var length = (string_width(input_text));
		var height = (18);
		
		draw_line((x+length)+(console_line_diff), y, x+length+(console_line_diff), y+height);
	}
	
}
