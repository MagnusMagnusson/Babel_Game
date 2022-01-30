
try{
	show_debug_message("Response recieved");
	if(ds_map_exists(request_map, async_load[?"id"])){
		show_debug_message("Response found");
		if(async_load[?"http_status"] == "200"){
			show_debug_message("Status 200");
			show_debug_message(request_map[? async_load[?"id"]]);
			switch(request_map[? async_load[?"id"]]){
				case net_requests.get_scores:{
					var _scores = json_parse(async_load[?"result"]);
					process_scores(_scores);
					break;
				}				
				case net_requests.post_scores:{
					var rsp =  json_parse(async_load[?"result"]);
					var entry = rsp[$"r"];
					var mode = rsp[$"m"];
					
					var a = ["a","m","w","t"];
					for(var i = 0; i < 4; i++){
						array_push(scores[$ mode][$"t" + a[i]], entry);
						array_push(scores[$ mode][$"w" + a[i]], entry);						
						sort_scores(scores[$ mode][$"t" + a[i]],scores[$ mode][$"w" + a[i]]);
						scores[$ mode][$"t" + a[i]] = strip_scores(scores[$ mode][$"t" + a[i]]);
						scores[$ mode][$"w" + a[i]] = strip_scores(scores[$ mode][$"w" + a[i]]);
					}
					break;
				}				
				case net_requests.get_user:{
					break;
				}
			}
		}
	}
}
catch(ex){
	show_debug_message("========EXCEPTION=======");
	show_debug_message(ex);
}