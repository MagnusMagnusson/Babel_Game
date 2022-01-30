global.headers = ds_map_create();

#macro isProd true
#macro prodUrl "https://gmcjam.mmagnusson.net/jam42"
#macro devUrl "http://127.0.0.1:8080/jam42"
#macro __url isProd ? prodUrl : devUrl
#macro platform_name "OPERAGX"
global.username = undefined;
enum net_requests{
	get_scores,
	post_scores,
	get_user
}

ds_map_add(global.headers, "Content-type","application/json");
ds_map_add(global.headers, "Connection","close");

function highscore_submit(name,height, rooms, uid, mode){
	if(!instance_exists(o_network)){
		instance_create_depth(0,0,0,o_network);
	}
	ex = json_stringify({
		uid : uid,
		user : name,
		height : height,
		rooms : rooms,
		mode : mode,
		platform : platform_name
	})
	var uri = __url;
	uri += "/api/"+mode+"/scores"
	o_network.request_map[?http_request(uri, "POST", global.headers, ex)] = net_requests.post_scores;
}

function highscore_get(mode){
	if(!instance_exists(o_network)){
		instance_create_depth(0,0,0,o_network);
	}
	var uri = __url;
	uri += "/api/"+mode+"/scores";
	
	o_network.request_map[?http_request(uri, "GET", global.headers,"")] = net_requests.get_scores;
}

function user_get(mode, user){
	if(!instance_exists(o_network)){
		instance_create_depth(0,0,0,o_network);
	}
	
	var uri = __url;
	uri += "/api/"+mode+"/user/"+uid;
	o_network.request_map[?http_request(uri, "GET", global.headers,"")] = net_requests.get_user;
}