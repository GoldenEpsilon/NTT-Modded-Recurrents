#define init 
	global.spr_wrld = sprite_add_weapon("corsair_pickup.png", 7, 7);
	global.spr_plyr = sprite_add("corsair.png",5, 7, 8);
#define weapon_area
	return GameCont.hard + 10; // Never spawns 
#define weapon_load
	return 15;
#define weapon_swap
	return sndSwapPistol
#define weapon_auto
	return 0;
#define weapon_melee
	return 0;
#define weapon_laser_sight
	return 0;
#define weapon_sprt
	if instance_is(self,Player){
		gunshine = median(0,((weapon_get_load(wep) - chrg_corsair + 1)/weapon_load()) * 5, 5);
		return global.spr_plyr;
	}else return global.spr_wrld;
#define weapon_text
	return "shiver me timbers"
#define weapon_name 
	return "Corsair";
#define weapon_nospec_races 
	return ["venuz"];
	
#define weapon_nospec_chkrace
	var races = weapon_nospec_races();
	for(var i = 0;i<array_length(races);i++){
		if (string(argument0) = string(races[i]))
			return false;
	}
	return true;
	
#define weapon_canspec 
	if instance_is(self,Player){
		return weapon_nospec_chkrace(race);
	}else return true;
	
#define weapon_fire 
	sound_play(sndClusterLauncher);
	with(instance_create(x + lengthdir_x(4,gunangle),y + 4 + lengthdir_y(4,gunangle),CustomProjectile)){
		team = other.team;
		creator = other;
		damage = 8;
		sprite_index = sprScorpionBullet;
		speed = 8;
		image_speed = 0.4;
		direction = other.gunangle + (random_range(-5,5) * other.accuracy);
		image_angle = direction;
		hp = 6;
		hitlist = [];
		lastclean = current_frame;
		trail = -4;
		lasttrail = current_frame;
		on_hit = customproj_onhit;
		on_step = customproj_onstep;
	}
	chrg_corsair = 0;
	reload = weapon_get_load(wep);
	
#define customproj_onstep
	image_angle = direction;
	// This weapon doesn't make use of i-frames the same way others do. Instead, it stores which enemies it's tagged in an array
	// Periodically, we clear this array so they can double-tap enemies
	if lastclean < current_frame - 10{
		hitlist = [];
		lastclean = current_frame;
	}
	if place_meeting(x + hspeed, y + vspeed, Wall){
		lasttrail = current_frame;
		trail = -4;
		repeat(10) with(instance_create(x,y,Dust)){direction = random(360);speed = random_range(2,4);}
		move_bounce_solid(true);
		hp --;
	}
	if !instance_exists(trail) && lasttrail <= current_frame - 2{
		with(instance_create(x,y,CustomObject)){
			creator = other;
			alpha = 1;
			other.trail = self;
			if(fork()){
				while instance_exists(self){
					if instance_exists(creator){
						if creator.trail != self{
							creator = -4;
						}else{
							x = creator.x;
							y = creator.y;
							creator.lasttrail = current_frame;
						}
					}
					if point_distance(xstart,ystart,x,y) > 20 || !instance_exists(creator){
						alpha -= current_time_scale / 20;
						if instance_exists(creator) creator.trail = -4;
						
					}else{
					}
					wait 1;
				}
				exit;
			}
			on_draw = trail_draw;
		}
	}
	if hp <= 0 instance_delete(self);
#define trail_draw 
	draw_set_color(c_white);
	draw_set_alpha(alpha);
	draw_line_width(xstart,ystart,x,y,2);
	draw_set_alpha(1);
	if alpha <= 0 instance_destroy();
#define customproj_onhit 
	var _r = 0;
	with(other){
		for(var i = 0;i<array_length(other.hitlist);i++){
			if self = other.hitlist[i]{
				_r = 1;
				break;
			}
		}
		if !(_r){
			other.hitlist[array_length(other.hitlist)] = self;
			projectile_hit(self,other.damage,other.speed,other.direction);
			repeat(10) with(instance_create(other.x,other.y,Dust)){direction = random(360);speed = random_range(2,4);}
		}
	}
	
#define step
	if "chrg_corsair" not in self{
		chrg_corsair = 0;
	}
	// Set canspec to a value returned by script
	canspec = weapon_nospec_chkrace(race) * visible;
	// Do a check to make sure that you can use your special
	if button_pressed(index,"pick"){
		wait 1;
		if instance_exists(self){
			if wep != mod_current{
				if is_string(wep){
					
				}else canspec = visible;
			}
		}
	}
	if wep = mod_current{
		if button_released(0,"fire") && weapon_get_load(wep) - chrg_corsair + 1 = 1{
			weapon_fire();
		}
		if button_released(0,"spec") && weapon_get_load(wep) - chrg_corsair + 1 = 1 && !weapon_nospec_chkrace(race){
			repeat((2 + (2*skill_get(5))) *(1+(.5*ultra_get("venuz",2)))){
				weapon_fire();
			}
			chrg_corsair -= weapon_load() * (2 + (2*skill_get(5))) *(1+(.5*ultra_get("venuz",2)));
		}
		if button_check(0,"fire") || (button_check(0,"spec") && !weapon_nospec_chkrace(race)){
			if chrg_corsair < weapon_get_load(wep){
				chrg_corsair = min(chrg_corsair + current_time_scale, weapon_get_load(wep));
				if chrg_corsair = weapon_get_load(wep){
					sound_play_pitchvol(sndCursedReminder,2,2);
				}
			}
		}else{
			can_shoot = false;
			if chrg_corsair > 0{
				chrg_corsair -= current_time_scale;
			}else{
				chrg_corsair += current_time_scale;
			}
				
		}
		// We're gonna make use of the HUD today!
		reload = weapon_get_load(wep) - chrg_corsair + 1;
	}