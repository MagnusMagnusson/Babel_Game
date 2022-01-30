scores = {
	modern:{	
		ta:[],
		tm:[],
		tw:[],
		tt:[],		
		wa:[],
		wm:[],
		ww:[],
		wt:[],
	},
	classic:{	
		ta:[],
		tm:[],
		tw:[],
		tt:[],		
		wa:[],
		wm:[],
		ww:[],
		wt:[],
	},
	acrobat:{	
		ta:[],
		tm:[],
		tw:[],
		tt:[],		
		wa:[],
		wm:[],
		ww:[],
		wt:[],
	}

}

request_map = ds_map_create();

filter = function(arr, date){
	var a = [];
	
}

sort_scores = function(arr1,arr2){
	array_sort(arr1, function(a, b){		
		if(a.uid == "X"){
			return 1;
		} 
		if(b.uid == "X"){
			return -1;
		}
		return b.h - a.h;
	});
	array_sort(arr2, function(a, b){
		if(a.uid == "X"){
			return 1;
		} 
		if(b.uid == "X"){
			return -1;
		}
		return b.r - a.r;
	});
}

strip_scores = function(arr){
	var found = {};
	var ret = [];
	
	for(var i = 0; i < array_length(arr); i++){
		var u = arr[i];
		var uid = u.uid;
		if(variable_struct_exists(found,uid)){
			continue;
		}
		found[$uid] = true;
		array_push(ret, u);
	}
	return ret;
}

process_scores = function(_scores, mode){
	now = date_current_datetime();
	yesterday = date_inc_hour(now, -24);
	last_week = date_inc_hour(now, -24*7);
	last_month = date_inc_hour(now, -24*7*30);
	
	var ta = [];
	var wa = [];
	var l = array_length(_scores.r);
	array_copy(ta,0,_scores.r,0,l);
	array_copy(wa,0,_scores.r,0,l);
	sort_scores(ta, wa);
	
	scores[$_scores.m][$"ta"] = strip_scores(ta);
	scores[$_scores.m][$"wa"] = strip_scores(wa);
	
}
