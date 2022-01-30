movement = 0;
if(movement <= 0){
	paused = false;
	difficulty = min(difficulty + 2, 64 );
	l++;
	bgColor(l);
	next_level();
} 