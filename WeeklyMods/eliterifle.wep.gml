#define weapon_name // Name
	return "ELITE IDPD RIFLE";

#define weapon_type
	return 5;

#define weapon_area
return GameCont.hard + 100;// Never drops

#define weapon_cost
	return 1;

#define weapon_load 
	return 14;
	
#define weapon_auto
	return true;
	
#define weapon_swap
	return sndSwapEnergy;
	
#define weapon_sprt // Wep Sprite
	return sprElitePopoGun;

#define weapon_text // Loading Tip
	return "GOOD IDEA!"

#define weapon_fire 
	if(fork()){
		var xx = x, yy = y, ang = gunangle, tt = team, ammo = 3;
		repeat(ammo){
			if instance_exists(self){
				xx = x; yy = y; ang = gunangle;
			}
			with(instance_create(xx,yy,IDPDBullet)){
				team = tt;
				direction = ang + random_range(-5,5) ;
				image_angle = direction;
				speed = 16;
			}
			wkick = 5;
			sound_play_pitch(sndRogueRifle,random_range(0.8,1.2));
			ammo --;
			wait 2;
		}
	}
	
#define cycle
    /// cycle(value, min, max)
	/// Thanks yal
    var result, delta;
    delta = (argument2 - argument1);
    result = (argument0 - argument1) mod delta;
    if (result < 0) result += delta;
    return result + argument1;
	
#define button_check_multi
	var args = [], ind = argument[0];
	for(var i = 1;i<argument_count;i++){
		args[i - 1] = argument[i];
	}
	for(var i = 0;i<array_length_1d(args);i++){
		if button_check(ind, args[i]) return true;
	}
	return false;
#define step
	with(EliteGrunt){
		if ("eliteRifleInit" not in self){
			eliteRifleInit = 1;
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
			lastRoll = current_frame;
		}
		if wep = mod_current{
			canspec = false;
			if button_check(index, "spec"){
				if lastRoll < current_frame - 5{
					angle = (right == 1) * 180;
				}
				lastRoll = current_frame;
				var diff = cycle(gunangle - angle, -180, 180);
				if !button_check_multi(index, "nort","east","sout","west"){
					if (abs(diff) < 2){
						angle = gunangle;
					}else{
						angle += min(10,diff * (0.20 * current_time_scale));
					}
					motion_add(angle, 6);
				}else angle = direction;
				if random(3 / current_time_scale) < 1{
					with(instance_create(x + random_range(-2,2), y + random_range(-2,2), Smoke)){
						depth = other.depth + 1;
					}
				}
				speed = 8;
			}else{
				angle = 0;
				variable_instance_set(self, "chrg_" + mod_current, 0);
			}
		}else canspec = visible;
	}