randomize();
settings = load_settings("settings.dat");
if(!variable_struct_exists(settings,"name")){
	settings.name = "";
}

alarm[1] = 1;

audio_play_sound(snd_mythos,100,true);

show_debug_message(settings.uid);