function load_settings(file){
	// ensure that value to be saved is actually a progress compared to existing metadata
    var existing_buffer = buffer_load(file);
    if (existing_buffer != -1) {
        var json = buffer_read(existing_buffer, buffer_string);
        buffer_delete(existing_buffer)
        return json_parse(json);
    } else {
		var randId = ""
		repeat(16){
			randId += choose("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9");
		}
		return {
			uid : randId
		};
	}
}

function save_settings(file, data){
	var json = json_stringify(data);
	var buffer = buffer_create(1, buffer_grow, 1);
    buffer_write(buffer, buffer_string, json);
    buffer_save(buffer, file);
    buffer_delete(buffer);
}