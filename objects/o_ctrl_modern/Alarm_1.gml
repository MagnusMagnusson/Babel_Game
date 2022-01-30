with(o_block){
	locked = true;
	first = true;
}


highscore_get("modern");
with(o_block){
	for(i = 0; i < 6; i++){
		var b = instance_create_layer(x,y-64 * (i + 1),other.blockLayer,o_block);
		b.first = true;
		b.locked = true;
		b.image_xscale = 0.5;
		b.image_yscale = 0.5;
	}
}