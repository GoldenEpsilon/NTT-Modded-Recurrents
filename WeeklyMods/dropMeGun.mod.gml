#define step
	with(Player){
		if "dropMeGun" not in self{
			dropMeGun = 0;
		}
		if button_check(index,"pick"){
			dropMeGun += current_time_scale;
			if dropMeGun > 60{
				with(instance_create(x,y,WepPickup)){
					wep = other.wep;
				}
				wep = bwep;
				bwep = 0;
				dropMeGun = 0;
			}
		}
	}