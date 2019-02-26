#define init
    global.gce = 0;
	trace("Challenge Mode is enabled; Good luck.");
	
#define step

	with(Player) if instance_exists(GenCont){
		wep = irandom_range(1,38);
		bwep = 0;
	}
	
	with(WepPickup) if instance_exists(WepPickup){
		instance_destroy();
		instance_create(Player.x, Player.y, choose(AmmoPickup, HPPickup));
		}
		
	with(AmmoChestMystery) if instance_exists(AmmoChestMystery){
		instance_change(AmmoChest, false);
	}
	
	if instance_exists(GenCont) || instance_exists(menubutton){
        global.gce = 1;
    }else{
        if global.gce = 1{
            if(fork()){
                wait 2;
				repeat (2) instance_create(Player.x, Player.y, AmmoChest);
				
                exit;
            }
            global.gce = 0;
        }
    }