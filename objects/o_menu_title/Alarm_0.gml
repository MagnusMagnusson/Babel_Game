if(global.first){
	global.first = false;
	audio_play_sound(snd_mythos,100,true);
	try{
	global.username = gxc_get_query_param("username");
	global.uid = gxc_get_query_param("userId");
	} catch(e){
		global.username = undefined;
		global.uid = undefined;
	}

	try{
	if ( is_undefined(global.username) || is_undefined(global.uid))
	{
		gxc_get_profile(function(_status, _result)
	        {
			if (_status == 200)
	                {
				global.username = _result.data.username;
				global.uid = _result.data.userId;
			}
		});
	}
	} catch(e){
		show_debug_message(e)
	}


}

