/// @description TEXT OUTPUT

//output varaiable
global.text_input_output = input_text;

//resets the text input dont touch this
input_text = "";
input_text_location = 0;

o_name.settings.name = global.text_input_output;
save_settings("settings.dat", o_name.settings);

room_goto_next();
