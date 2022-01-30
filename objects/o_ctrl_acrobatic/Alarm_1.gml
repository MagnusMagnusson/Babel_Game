
with(o_block){
	for(i = 0; i < 5; i++){
		var b = instance_create_layer(x,y-64 * (i + 1),other.blockLayer,o_block);
		b.first = true;
		b.locked = true;
		b.image_xscale = 0.5;
		b.image_yscale = 0.5;
	}
}


with(o_block){
	first = true;
	locked = true;
}

highscore_get("acrobat");