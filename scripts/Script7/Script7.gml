function sc_v(){
	if(score == -sc2){
		sc3 = score div 9;
		sc4 = score % 9;
	} else{
		if(score == sc3 * 9 + sc4){
			sc2 = -score;
		} else{
			if(sc3 * 9 + sc4 == -sc2){
				score = -sc2;
			} else{
				score = min(-sc2, sc3 * 9 + sc4, score);
				sc2 = -score;
				sc3 = score div 9;
				sc4 = score % 9;
			}
		}
	}
}

function rm_v(){
	if(rooms == -rm2){
		rm3 = rooms div 17;
		rm4 = rooms % 17;
	} else{
		if(rooms == rm3 * 17 + rm4){
			rm2 = -rooms;
		} else{
			if(rm3 * 17 + rm4 == -rm2){
				rooms = -rm2;
			} else{
				rooms = min(-rm2, rm3 * 17 + rm4, rooms);
				rm2 = -rooms;
				rm3 = rooms div 17;
				rm4 = rooms % 17;
			}
		}
	}
}

function sc_reset(){
	score = 0;
	sc2 = 0;
	sc3 = 0;
	sc4 = 0;
}

function rm_reset(){
	rooms = 0;
	rm2 = 0;
	rm3 = 0;
	rm4 = 0;
}

function sc_inc(inc){
	sc_v();
	score += inc;
	sc2 -= inc;
	sc4 += inc;
	sc3 += sc4 div 9;
	sc4 = sc4 % 9;
}


function rm_inc(inc){
	sc_v();
	rooms += inc;
	rm2 -= inc;
	rm4 += inc;
	rm3 += rm4 div 17;
	rm4 = rm4 % 17;
}