if !(text_input_enabled) exit;

//keep input_text_location in bounds
input_text_location = clamp(input_text_location,0,string_length(input_text));

//line blink
input_line_blink = true;
alarm[0] = input_line_blink_speed;

if keyboard_check_released(vk_anykey) && (alarm[1] != -1){
	//set timer speed
	alarm[1] = (-1);
	keyboard_key = 0;	
}


if !keyboard_check(vk_shift) && keyboard_check(vk_control){
//PRESSING CONTROL
	//if we are pressing control and press these keys
	switch(keyboard_key){
		//go backwards in selected location
		case vk_left:{
			
			if (input_text_location != 0){
				//delete everything after the locaion we are at because we are going backwards
				var _text_input_copy = string_delete(input_text,input_text_location,string_length(input_text)-input_text_location);
				//get number of spaces in the new string
				var _num_spaces = string_count(" ",_text_input_copy);
			
				//loop through all the spaces found except the last one
				for (var i = 0; i < _num_spaces-1; i++)
				{
					//replace all the spaces we dont care about with S's so we dont find them again
					var _space_location = string_replace(_text_input_copy," ","S");
					_text_input_copy = _space_location;
				}
				//our new jump point is the last " " in the string
				var _jump_to_new_word_number = string_pos(" ",_text_input_copy)
			
				//update our location
				input_text_location = _jump_to_new_word_number-1;
			}
			
			//Incase we want to go back even though theres no more spaces behind us
			if (input_text_location < 0) input_text_location = 0;
		}break;
		
		//go forwards in selected location
		case vk_right:{
			//make a new string holding all the text after were we are on the string
			var _text_input_next_word = string_copy(input_text,input_text_location+1,string_length(input_text)-input_text_location);
			//find the first " " after our location
			var _next_word_jump_count = string_pos(" ",_text_input_next_word);
			//if there is no space it probably means we've reached the end so just jump to the end
			if (_next_word_jump_count = 0) _next_word_jump_count = string_length(input_text);
			//update the number so its correct with our actual location
			var _jump_to_new_word_number = input_text_location+_next_word_jump_count;
			
			//update location
			if (input_text_location != string_length(input_text)){
				input_text_location = _jump_to_new_word_number;
			}
			
			//incase we somehow broke out of the string
			if (input_text_location > string_length(input_text)) input_text_location = string_length(input_text);
		}break;
		
		//Paste
		case ( ord("V") ) :{
			if (os_device == os_windows){
				input_text += clipboard_get_text(); input_text_location = string_length(input_text); 
			}
		}break;
		
		//Delete all
		case vk_backspace :{
			input_text = string_copy(input_text,0,(string_length(input_text) - string_length(input_text)) ); 
			input_text_location = string_length(input_text); 
		}break;
		
		//ENTER AND START COMMAND CODE
		case vk_enter:{ 
			input_text_location = 0; 
			event_user(0); 
		}break;
		
		//default just add the key
		default:{ 
			//alarm[1] = input_new_key_timer_time; 
			//input_text = string_insert((keyboard_lastchar),input_text,input_text_location);
			//if (keyboard_lastchar != "") input_text_location += 1;
		}break;
		
	}
}else{
	if !keyboard_check(vk_control) && keyboard_check(vk_shift){
		switch(keyboard_key){
			//go backwards in selected location
			case vk_left:{
			}break;
		
			//go forwards in selected location
			case vk_right:{
			}break;
			
			
		//Delete all
		case vk_backspace :{
		//prevents increaseing the input_text_location but not any text
		}break;
		
		//ENTER AND START COMMAND CODE
		case vk_enter: input_text_location = 0; event_user(0); break;
			
			//default just add the key
			default:{ 
				alarm[1] = input_new_key_timer_time;
				input_text = string_insert((keyboard_lastchar),input_text,input_text_location+1);
				if (keyboard_lastchar != "") input_text_location += 1;
			}break;
		}
	}else{
		
		//if where not pressing control but press theses special keys
		switch(keyboard_key){
			//ENTER AND START COMMAND CODE
			case vk_enter: input_text_location = 0; event_user(0); break;
		
			//backspace delete
			case vk_backspace:{
				alarm[1] = input_new_key_timer_time;
				//if where at the end of the string 
				if (input_text_location == string_length(input_text)){
					//backspace one character at the end of the string and update input_text_location
					input_text = string_copy(input_text,0,(string_length(input_text) - 1) ); input_text_location = string_length(input_text); 
				}else{
					if(input_text_location != 0){
						//otherwise delete the character behind the current location and then update that location so where in the same place
						input_text = string_delete(input_text,input_text_location,1); input_text_location -= 1;
					}
				}
			}break;
		
			//last input
			case vk_up: input_text = last_text; input_text_location = string_length(input_text); break;
		
		
			//go backwards in selected location
			case vk_left:{
				alarm[1] = input_new_key_timer_time;
				if (input_text_location != 0){
					input_text_location -= 1;
				}
			}break;
		
			//go forwards in selected location
			case vk_right:{
				alarm[1] = input_new_key_timer_time;
				if (input_text_location != string_length(input_text)){
					input_text_location += 1;
				}else{
					input_text_location = string_length(input_text); 	
				}
			}break;
		
			//delete the carracter in front of us
			case vk_delete:{
				alarm[1] = input_new_key_timer_time;
				if (input_text_location != string_length(input_text)){
					input_text = string_delete(input_text,input_text_location+1,1);	
				}
			}break;
		
			//default just add the key
			default: {
				alarm[1] = input_new_key_timer_time; 
				input_text = string_insert((keyboard_lastchar),input_text,input_text_location+1);
				if (keyboard_lastchar != "") input_text_location += 1; 
			}break;
		}
	}
}

//CLEAR ALL DATA SO UNDEFINED KEYS DO NOT REPEAT LAST KEYS
keyboard_lastchar = "";