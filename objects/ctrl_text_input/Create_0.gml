text_input_enabled = true;

//your output when pressing enter
global.text_input_output = "";


input_text = ""; //prevents crash
last_text = "";
input_text_location = 0; //start of location that we want to edit the acutal text string


input_string_color = c_white; //DEFAULT COLOR FOR TEXT


//for the blinking line effect
input_line_blink = true;
input_line_blink_speed = 27.35;
alarm[0] = input_line_blink_speed;

input_new_key_timer_time = room_speed+(room_speed/4);