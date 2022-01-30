/// @description input_new_key_timer

//line blink
input_line_blink = true;
alarm[0] = input_line_blink_speed;

if keyboard_check_released(vk_anykey){
	//set timer speed
	var input_new_key_timer = (-1);
	keyboard_key = 0;	
}

//allow every button
var press_left_alarm = true;
var press_right_alarm = true;
var	press_delete_alarm = true;
var	press_backspace_alarm = true;
var	press_any_alarm = true;
//set timer speed
var input_new_key_timer = ((room_speed/10)/2);

//check what button we have held down
switch(keyboard_key){
	//ANY KEY IS PRESSED
	default:{
		if (press_any_alarm = true){
			press_left_alarm = false;
			press_right_alarm = false;
			press_delete_alarm = false;
			press_backspace_alarm = false;
			press_any_alarm = false;
			if keyboard_check(vk_anykey){
				input_text = string_insert((keyboard_lastchar),input_text,input_text_location+1);
				if (keyboard_lastchar != "") input_text_location += 1;
			}
			alarm[1] = input_new_key_timer;
		}
	}break;
	
	//LEFT KEY IS STILL PRESSED
	case vk_left:{
		if (press_left_alarm = true){
			press_left_alarm = false;
			press_right_alarm = false;
			press_delete_alarm = false;
			press_backspace_alarm = false;
			press_any_alarm = false;
			if (input_text_location != 0)
			{
				input_text_location -= 1;
			}
			alarm[1] = input_new_key_timer;
		}
	}break;

	//RIGHT KEY IS STILL PRESSED
	case vk_right:{
		if (press_right_alarm = true){
			press_left_alarm = false;
			press_right_alarm = false;
			press_delete_alarm = false;
			press_backspace_alarm = false;
			press_any_alarm = false;
			if (input_text_location != string_length(input_text))
			{
				input_text_location += 1;
			}else{
				input_text_location = string_length(input_text); 	
			}
			alarm[1] = input_new_key_timer;
		}
	}break;

	//DELETE KEY IS STILL PRESSED
	case vk_delete: {
		if (press_delete_alarm = true){
			press_left_alarm = false;
			press_right_alarm = false;
			press_delete_alarm = false;
			press_backspace_alarm = false;
			press_any_alarm = false;
			if (input_text_location != string_length(input_text)){
				input_text = string_delete(input_text,input_text_location+1,1);	
			}
			alarm[1] = input_new_key_timer;
		}
	}break;

	//BACKSPACE KEY IS STILL PRESSED
	case vk_backspace: {
		if (press_backspace_alarm = true){
			press_left_alarm = false;
			press_right_alarm = false;
			press_delete_alarm = false;
			press_backspace_alarm = false;
			press_any_alarm = false;
			if (input_text_location == string_length(input_text)){
				//backspace one character at the end of the string and update input_text_location
				input_text = string_copy(input_text,0,(string_length(input_text) - 1) ); input_text_location = string_length(input_text); 
			}else{
				if(input_text_location != 0){
					//otherwise delete the character behind the current location and then update that location so where in the same place
					input_text = string_delete(input_text,input_text_location,1); input_text_location -= 1;
				}
			}
			alarm[1] = input_new_key_timer;
		}
	}break;
}

				