#define init
global.leave = [Grunt, EliteGrunt, Inspector, EliteInspector, Shielder, EliteShielder, PopoFreak, Van, BanditBoss, ScrapBoss, LilHunter, FrogQueen, HyperCrystal, TechnoMancer, OasisBoss, WantBoss, WantLH, WantPopo, WantVan, WantRevivePopoFreak, RevivePopoFreak]; 
#define step
if (GameCont.loops > 0) {
	for (i = 0; i < array_length_1d (global.leave); ++i) {
		with (global.leave [i]) {
			seen = true;
		}
	}
	alarmReduce = GameCont.loops / 5.0;
	with (enemy) {
		alarm1 -= other.alarmReduce;
	        if (alarm1 > 1) {
        	    alarm1 -= other.alarmReduce;
        	}
		if ("seen" not in self) {
			seen = true;		
			if (!canChange ()) {
				continue;
			}
			if (random (GameCont.loops + 1) > 1) {
				instance_delete (self);
			} else {
				maxhealth *= (GameCont.loops + 1);
				my_health = maxhealth;
				raddrop *= 2;
			}
		}
	}

	with (AmmoPickup) {
		if ("seen" not in self) {
			seen = true;
			mult = 1 + GameCont.loops / 2;
			num *= mult;
		}
	}
}

#define canChange
if (GameCont.area = 7 && GameCont.subarea = 3) {
	return false;
}
if (GameCont.area = 0) {
	return false;
}

return true;
