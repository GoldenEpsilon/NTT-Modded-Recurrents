#define race_name 
	return "NUKE LAUNCHER";
	
#define race_text 
	return "WEAPON PHYSIOLOGY";

#define race_swep
	return wep_nuke_launcher;
	
#define race_tb_text
	
#define race_ultra_name
switch (argument0) {
	case 1: return "TSUKUMOGAMI DANCE";
	case 2: return "GUN GODZ BLESSING";
default: return "";
}

#define race_ultra_text
switch (argument0) {
	case 1: return "@pLEVITATION";
	case 2: return "@1(sprGoldNukeLauncher)";
default: return "";
}

#define race_ultra_take
	with(Player){
		if race = mod_current{
			if argument0 = 2{
				drawspr = sprGoldNukeLauncher;
			}else{
				with(thingy_create(x,y,3,3)){
					col = c_purple;
					persistent = true;
					creator = other;
				}
			}
		}
	}

	
#define create 
	image_alpha = 0;
	master = 0;
	maxhealth = 55;
	if skill_get(mut_back_muscle) && maxhealth = 55
		maxhealth = 99;
	wep = wep_nuke_launcher;
	canpick = false;
	canwalk = false;
	candie = false;
	if ultra_get(mod_current,2) = 1 drawspr = sprGoldNukeLauncher
		else drawspr = sprNukeLauncher;
	
#define init 
	with(instances_matching(CustomObject,"name","smear")) instance_destroy();
	with(instances_matching(CustomHitme,"name","tsukumogami")) instance_delete(self);
	global.gce = 0;
#define game_start
	init();
	
#define tsukumogami_create
	with(instance_create(argument0,argument1,CustomHitme)){
		name = "tsukumogami";
		my_health = 50;
		persistent = 1;
		mask_index = mskPlayer;
		image_speed = 0;
		wep = argument2;
		ammo = argument3;
		team = argument4;
		if wep = wep_nuke_launcher || wep = wep_golden_nuke_launcher race = mod_current;
		sprite_index = weapon_get_sprite(wep);
		direction = random(360);
		gunangle = direction;
		spin = 0;
		reload = weapon_get_load(wep);
		target = -4;
		
		alrm0 = 60;
		on_step = script_ref_create(tsuku_step);
	}
	
#define cycle
    /// cycle(value, min, max)
	/// Thanks yal
    var result, delta;
    delta = (argument2 - argument1);
    result = (argument0 - argument1) mod delta;
    if (result < 0) result += delta;
    return result + argument1;

#define tsuku_step 				
	if array_length_1d(instances_matching(Player,"race",mod_current)) > 0{
		var p = instance_nearest(x,y,Player);// Indiscriminately moves towards a player
		if distance_to_object(p) > 24 motion_add(point_direction(x,y,p.x,p.y),0.5);
	}
	if alrm0 > 0{
		alrm0 -= current_time_scale;
		if alrm0 <= 0{
			if !(spin){
				if (!instance_exists(target) && target = -4) || !instance_exists(target){
					target = -4;
					if instance_exists(enemy){
						nearest = instance_nearest(x,y,enemy);
						if !collision_line(x,y,nearest.x,nearest.y,Wall,0,1) target = nearest;
					}
					alrm0 = 5;
				}else alrm0 = 60;
				if instance_exists(target){
					spin = 1;
					//trace("ALRIGHT MASTER! LET'S KILL DA HO!");
				}else alrm0 = 15;
			}else alrm0 = 15;
		}
	}
	if (reload > 0){
		reload -= current_time_scale;
	}else reload = 0;
	if (spin = 1){
		if instance_exists(target){
			var diff = cycle(point_direction(x,y,target.x,target.y) - image_angle, -180, 180);
			if abs(diff) <= 15 && reload <= 0{
				player_fire_ext(image_angle + random_range(-15,15),wep,x,y,team,self);
				reload = weapon_get_load(wep);
				motion_add(direction + 180,2);
				alrm0 = 60;
			}else image_angle += diff * 0.30;
		}else{
			if target != -4{
				target = -4;
				alrm0 = 5;
			}
			spin = 0;
		}
	}else{
		var diff = cycle(direction - image_angle, -180, 180);
		image_angle += diff * 0.20;
	}
	speed = min(speed,5);

#define step 
	if ultra_get(mod_current,2) = 1{
		with(WepPickup){
			if place_meeting(x,y,other) && button_pressed(other.index,"pick"){
				tsukumogami_create(x,y,wep,other.typ_ammo[weapon_get_type(wep)],other.team);
				instance_destroy();
			}
		}
	}
	reload = max(2,reload);
	//Sets maxhealth when you have back muscle 
	
	if button_pressed(index,"fire") && reload <= 2 && ammo[4] > 0{
		ammo[4] -= 3;
		my_health = ammo[4];
		player_fire_ext(gunangle,47,x,y,team,self)
	}
	if ultra_get(mod_current,1) = 0{
		if button_pressed(index,"spec"){
			motion_add(gunangle,2);
		}
	}else{
		if button_check(index,"spec"){
			motion_add(gunangle,1 + (skill_get(5)));
		}
		speed *= 0.90;
	}
	with(instances_matching(Nuke,"trail",undefined)){
		trail = 1;
		with(thingy_create(x,y,3,10 + (ultra_get(mod_current,2) * 2))){
			creator = other;
			if other.creator.race = mod_current && ultra_get(mod_current,1) = 1{
				col = c_purple;
			}else col = c_orange;
		}
		with(thingy_create(x,y,3,7 + (ultra_get(mod_current,2) * 2))){
			creator = other;
			if other.creator.race = mod_current && ultra_get(mod_current,1) = 1{
				col = merge_color(c_purple,c_gray,0.5);
			}else col = c_yellow;
			depth = -101;
		}
		with(thingy_create(x,y,3,4 + (ultra_get(mod_current,2) * 2))){
			creator = other;
			if other.creator.race = mod_current && ultra_get(mod_current,1) = 1{
				col = merge_color(c_purple,c_white,0.5);
			}else col = c_white;
			depth = -102;
		}
		if "master" not in self && instance_exists(creator){
			if "master" not in creator creator.master = 0
				else creator.master ++;
			master = creator.master;
			if "index" in creator index = creator.index;
		}
	}
	with(Nuke){
		if instance_exists(creator){
			if "master" in creator && "master" in self && "race" in creator{
				if creator.master = master && creator.race = mod_current{
					creator.x = x;
					creator.y = y;
					creator.image_angle = direction;
				}
				if "target" in creator{
					if instance_exists(creator.target){
						motion_add(point_direction(x,y,creator.target.x,creator.target.y),1);
					}
				}
			}
		}
		visible = false;
	}
	//Gives you ammo for 1/3 of gained health, to make it so that health isn't completely worthless
	if my_health > ammo[4]{
		ammo[4] += max(1,ceil((my_health - ammo[4]) * 0.33));
		my_health = ammo[4];
	}else my_health = ammo[4];
	
	if ammo[4] <= 0 && array_length_1d(instances_matching(Nuke,"master",master)) = 0{
		mercy -= current_time_scale;
		if mercy <= 0{
			wep = 0;
			instance_destroy();
		}
	}else{
		mercy = 60;
	}
	
#define thingy_create(xx,yy,len,siz)
	with(instance_create(xx,yy,CustomObject)){
		name = "smear";
		xpos = ds_list_create();
		ypos = ds_list_create();
		lpos = ds_list_create();
		dpos = ds_list_create();
		spos = ds_list_create();
		maxsize = siz;
		col = c_white;
		for(var i = 0;i<=len;i++){
			ds_list_add(xpos,xx);
			ds_list_add(ypos,yy);
			ds_list_add(lpos,10);
			ds_list_add(dpos,0);
			ds_list_add(spos,0);
		}
		on_step = script_ref_create(thingy_step);
		on_draw = script_ref_create(thingy_draw);
		depth = -100;
		creator = self;
		return self;
	}
	
#define thingy_step 
	with(Smoke) instance_destroy();
	if instance_exists(creator){
		x = creator.x;
		y = creator.y;
		creator.speed = min(8,creator.speed * 1.15)
		if current_frame mod 3 = 0{
			var xp = ds_list_find_value(xpos,ds_list_size(xpos) - 1),yp = ds_list_find_value(ypos,ds_list_size(ypos) - 1);
			ds_list_add(xpos,x);
			ds_list_add(ypos,y);
			ds_list_add(lpos,1);
			ds_list_add(dpos,point_direction(xp,yp,x,y));
			ds_list_add(spos,0);
		}else{
			ds_list_set(xpos,ds_list_size(xpos)-1,creator.x);
			ds_list_set(ypos,ds_list_size(ypos)-1,creator.y);
		}
	}
	for(var i = 0;i<ds_list_size(lpos) - 1;i++){
		var val = ds_list_find_value(lpos,i);
		if ds_list_find_value(spos,i) = 0{
			if val < maxsize ds_list_set(lpos,i,min(val + ((maxsize - val) * 0.33),maxsize));
			if ds_list_find_value(lpos,i) >= maxsize - (maxsize * 0.5) ds_list_set(spos,i,1)
		}else ds_list_set(lpos,i,max(val - 0.5,0));
		
		if ds_list_find_value(lpos, i) <= 0.25{
			ds_list_delete(lpos,i);
			ds_list_delete(xpos,i);
			ds_list_delete(ypos,i);
			ds_list_delete(dpos,i);
			ds_list_delete(spos,i);
		}
	}
#define thingy_draw 
	draw_set_color(col);
	draw_primitive_begin(pr_trianglestrip);
	for(var i = 0;i<ds_list_size(xpos);i++){
		var xx = ds_list_find_value(xpos,i),yy = ds_list_find_value(ypos,i),dd = ds_list_find_value(dpos,i) + 90,ll = ds_list_find_value(lpos,i);
		if ll != 0{
			draw_vertex(xx + lengthdir_x(ll,dd),yy + lengthdir_y(ll,dd));
			draw_vertex(xx - lengthdir_x(ll,dd),yy - lengthdir_y(ll,dd));
			
			if i + 1 < ds_list_size(xpos){
				xx = ds_list_find_value(xpos,i+1);
				yy = ds_list_find_value(ypos,i+1);
				ll = ds_list_find_value(lpos,i+1);
				draw_vertex(xx + lengthdir_x(ll,dd),yy + lengthdir_y(ll,dd));
				draw_vertex(xx - lengthdir_x(ll,dd),yy - lengthdir_y(ll,dd));
			}
		}
	}
	draw_primitive_end();
	draw_set_color(c_white);
	if ds_list_size(spos) <= 1 instance_delete(self);
	
#define draw 
	draw_sprite_ext(drawspr,0,x,y,1,1,gunangle,c_white,visible);