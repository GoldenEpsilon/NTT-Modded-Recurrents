#define step
	with(ScrapBoss){
		if ("sniper_processed" not in self){
			for(var i=1;i<=3;i++){
				slave[i] = instance_create(x,y,Sniper);
				with(slave[i]){
					mask_index = mskNone;
					depth = other.depth - 1;
					canfly = 1;
					flung = 0;
					slaveowner = other.id;
					x = other.x + lengthdir_x(24,360/3 * i);
					y = other.y + lengthdir_y(24 * 0.33,360/3 * i);
					z = 0;
					_x = other.x;
					xspd = 0;
					zspd = 0;
				}
			}
			_x = x;
			_y = y;
			spindir = 0;
			sniper_processed = 1;
		}else{
			if sprite_index = sprScrapBossFire spindir += 60 * turn;
			for(var i = 1;i<array_length_1d(slave);i++){
				with(slave[i]){
					var spinlen = 24;
					x = other.x + lengthdir_x(spinlen,other.spindir + ((360/3) * i));
					y = other.y - 4 + lengthdir_y(spinlen * 0.25,other.spindir + ((360/3) * i));
					_x = other.x;
					if y > other.y - 4 && other.sprite_index != sprScrapBossFire depth = other.depth + 1
						else depth = other.depth - 1;
					my_health = maxhealth;
					walk = 0;
				}
			}
		}
	}
	with(Sniper){
		if ("slaveowner" in self){
			if !instance_exists(slaveowner){
				sprite_index = spr_hurt;
				image_index = 2;
				alarm1 = -1;
				alarm2 = -1;
				alarm3 = -1;
				alarm4 = -1;
				if !instance_exists(BigDogExplo) && flung = 0{
					zspd = 8;
					_y = y;
					depth = -10;
					if x < _x xspd = -2 - random(3)
						else xspd = 2 + random(3);
					flung = 1;
				}
			}
			if flung = 1{
				if z + zspd <= 0{
					my_health = 0;
				}else z += zspd;
				
				zspd -= 0.5;
				x += xspd;
				y = _y - z;
			}
		}
	}