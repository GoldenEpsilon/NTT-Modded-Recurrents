#define weapon_name // Name
	return "IDPD MINIGUN";

#define weapon_type
	return 5;

#define weapon_area
return GameCont.hard + 100;// Never drops

#define weapon_cost
	return 4;

#define weapon_load 
	return 30;
	
#define weapon_auto
	return true;
	
#define weapon_swap
	return sndSwapEnergy;
	
#define weapon_sprt // Wep Sprite
	return sprPopoPlasmaMinigun;

#define weapon_text // Loading Tip
	return "GOOD IDEA!"

#define weapon_fire 
	if(fork()){
		var xx = x, yy = y, ang = gunangle, tt = team, ammo = 5;
		repeat(ammo){
			if instance_exists(self){
				xx = x; yy = y; ang = gunangle;
			}
			with(instance_create(xx,yy,PopoPlasmaBall)){
				team = tt;
				direction = ang + random_range(-15,15) ;
				image_angle = direction;
				if skill_get(mut_laser_brain){
					image_xscale *= 1.10;
					image_yscale = image_xscale;
				}
			}
			wkick = 5;
			sound_play_pitch(sndPlasmaMinigun,random_range(0.8,1.2));
			ammo --;
			wait 4;
		}
	}

#define step
	with(EliteShielder){
		if ("eliteMiniInit" not in self){
			eliteMiniInit = 1;
			if(fork()){
				while instance_exists(self){
					var xx = x, yy = y;
					wait 1;
					if !instance_exists(self) && random(4) < 1{
						with(instance_create(xx, yy, WepPickup)){
							wep = mod_current;
						}
					}
				}
				exit;
			}
		}
	}
	if instance_is(self,Player){
		if ("chrg_" + mod_current) not in self{
			variable_instance_set(self, "chrg_" + mod_current, 0);
			lastTele = current_frame;
		}
		if wep = mod_current{
			canspec = false;
			if button_check(index, "spec") && lastTele < current_frame - 30{
				if variable_instance_get(self,"chrg_" + mod_current) + current_time_scale < 45{
					if array_length_1d(instances_matching(PopoShield,"creator", self)) = 0{
						with(instance_create(x,y,PopoShield)){
							creator = other;
							team = other.team;
						}
					}
					variable_instance_set(self, "chrg_" + mod_current, variable_instance_get(self,"chrg_" + mod_current) + current_time_scale);
					reload = max(reload, weapon_get_load(wep) * 0.5);
				}else{
					var _r = 0;
					if place_meeting(mouse_x[index],mouse_y[index],Floor){
						if place_meeting(mouse_x[index],mouse_y[index],Wall){
							_r = 1;
						}
					}else _r = 1;
					if _r{
						var n = instance_nearest(mouse_x[index],mouse_y[index],Floor);
						x = n.x + 16;
						y = n.y + 16;
					}else{
						x = mouse_x[index];
						y = mouse_y[index];
					}
					with(instances_matching(PopoShield, "creator", self)){
						x = other.x;
						y = other.y;
						sprite_index = spr_dead;
						image_speed = 0.4;
						image_index = 0;
					}
					variable_instance_set(self,"chrg_" + mod_current, 0);
					lastTele = current_frame;
				}
				trace(variable_instance_get(self, "chrg_" + mod_current))
			}else variable_instance_set(self,"chrg_" + mod_current, 0);
		}else canspec = visible;
	}