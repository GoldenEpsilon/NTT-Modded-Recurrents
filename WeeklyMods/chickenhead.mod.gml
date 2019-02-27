#define step
	with(instances_matching(Player,"race","chicken")){
		if spr_idle = sprMutant9Idle{
			spr_idle = sprMutant9HeadlessIdle;
			spr_walk = sprMutant9HeadlessWalk;
			spr_hurt = sprMutant9HeadlessHurt;
			with(instance_create(x,y,Corpse)) sprite_index = sprMutant9HeadIdle;
		}
	}
	with(instances_matching(Corpse,"sprite_index",sprMutant9HeadIdle)){
		if "slave" not in self{
			slave = 0;
			friction = 0;
			slaveowner = id;
		}
		if(slave){
			if instance_exists(slaveowner){
				var dir,_heightmod;
				if slaveowner.hspeed > 0 dir = 1
					else dir = -1;
				x = slaveowner.x + lengthdir_x(slaveowner.speed,slaveowner.direction);
				y = slaveowner.y + lengthdir_y(slaveowner.speed,slaveowner.direction) - 2 + (slaveowner.image_index mod 3);
				speed = 0;
				depth = slaveowner.depth - 1;
				if slaveowner.right = 1{
					image_angle = 90 - ((60 - ((slaveowner.hspeed * 8)) * slaveowner.right));
				}else{
					image_angle = 90 + ((60 - ((slaveowner.hspeed * 8)) * slaveowner.right));
				}
				image_yscale = slaveowner.right;
				image_xscale = 1;
			}else instance_destroy();
		}
	}
	
#define draw
	with(instances_matching(Corpse,"sprite_index",sprMutant9HeadIdle)){
		if "slave" in self{
			if distance_to_object(Player) < 4{
				if !(slave){
					var closestplayer = instance_nearest(x,y,Player);
					//if closestplayer.spr_idle = sprMutant9HeadlessIdle{
						draw_sprite(sprEPickup, 0, x-12, y-20);
						draw_text_nt(x+8, y-32, "USE");
						if button_pressed(closestplayer.index,"pick"){
							slaveowner = closestplayer.id;
							slave = 1;
							speed = 0;
							mask_index = mskNone;
							persistent = true;
						}
					//}
				}else{
					if instance_exists(slaveowner){
						if slaveowner.gunangle > 180{
							draw_sprite_ext(weapon_get_sprite(slaveowner.wep),0,slaveowner.x,slaveowner.y,1,slaveowner.right,slaveowner.gunangle + slaveowner.wepangle,c_white,1)
						}
					}
				}
			}
		}
	}