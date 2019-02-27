#define step
with(NothingDeath){
if "dropped" not in self{
dropped = 1;
with instance_create(x,y,WepPickup){
			wep = choose("thronebeam","thronecannon","thronegun");
		}
	}
}

with(BanditBoss){
if my_health <= 0 && "dropped" not in self{
if instance_number(BanditBoss) = 1{
dropped = 1;
		if irandom(2) = 0{
with instance_create(x,y,WepPickup){
			wep = "bigblaster";
			}
		    }
		}
	}
}

with(FrogQueen){
if my_health <= 0 && "dropped" not in self{
dropped = 1;
		if irandom(1) = 0{
with instance_create(x,y,WepPickup){
			wep = "ballmomblaster";
			}
		}
	}
}


with(ScrapBoss){
if my_health <= 0 && "dropped" not in self{
dropped = 1;
		if irandom(2) = 0{
with instance_create(x,y,WepPickup){
			wep = "doghead";
			}
		}
	}
}

with(HyperCrystal){
if my_health <= 0 && "dropped" not in self{
dropped = 1;
if GameCont.area = 104{
with instance_create(x,y,WepPickup){
			wep = "invcrystallaser";
			curse = 1;
			}
}else{
		if irandom(1) = 0{
with instance_create(x,y,WepPickup){
			wep = "crystallaser";
			}
	    }
	}
    }
}

with(LilHunter){
if my_health <= 0 && "dropped" not in self{
dropped = 1;
		if irandom(2) = 0{
with instance_create(x,y,WepPickup){
			wep = "lilgunther";
			}
		}
	}
}

with(TechnoMancer){
if my_health <= 0 && "dropped" not in self{
if instance_number(TechnoMancer) = 1{
dropped = 1;
if irandom(1) = 1{
with instance_create(x,y,WepPickup){
			wep = "necromachine";
		}
	    }
	}
    }
}

with(Sniper){
if my_health <= 0 && "dropped" not in self{
dropped = 1;
		if irandom(39) = 0{
with instance_create(x,y,WepPickup){
			wep = "sniper";
			}
		}
	}
}

with(Bandit){
if my_health <= 0 && "dropped" not in self{
dropped = 1;
		if irandom(59) = 0{
with instance_create(x,y,WepPickup){
			wep = "banditblaster";
			}
		}
	}
}

with(Scorpion){
if my_health <= 0 && "dropped" not in self{
dropped = 1;
		if irandom(99) = 0{
with instance_create(x,y,WepPickup){
			wep = "scorpionarm";
			}
		}
	}
}

with(GoldScorpion){
if my_health <= 0 && "dropped" not in self{
dropped = 1;
		if irandom(49) = 0{
with instance_create(x,y,WepPickup){
			wep = "goldscorpionarm";
			}
		}
	}
}

with(Raven){
if "my_health" in self{
if my_health <= 0 && "dropped" not in self{
dropped = 1;
		if irandom(39) = 0{
with instance_create(x,y,WepPickup){
			wep = "rapidpistol";
			}
		}
	}
   }
}