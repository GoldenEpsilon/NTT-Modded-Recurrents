#define init
	/*
		Bandit
		Active: Bash Attack
		* A bash attack
		Passive: Low Capacity
		* Lower max level
		* Bandit Blaster Only
		
		Thronebutt
		* Crow Blaster
		
		Ultra A
		* Decrease level to 4 + (Times Ultra A is taken)
		* Increases Bash Base Damage by 2 when taken more than three times
		
		Ultra B
		* Increases base Bash damage
		* Big Bandit Gun found, but only if Ultra A is taken < 3 times
	*/
	global.Ultra[1] = 0;
	global.Ultra[2] = 0;
	global.holiday = 0;
	global.portrait = sprite_add_base64("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",1,30,236);
	
	global.mapicon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAACXBIWXMAAAsSAAALEgHS3X78AAABQ0lEQVQ4ja2UMWrDQBBF/wqfwo2MG6d2KhNSpHOfG8gH8AECKQI6gA6g3EBlQJ0L4aiycCk3RtvoGJkUyY5m5V3LIvmwoN2ZefPZFQP8s9RAnMbW+QIEAGkc4f7pGQBw2GUc3Ly8e+tdQHKBzN7osMsM2GL0gQzzgYagEkivmweE84UX4JI+n/CW7pk1kcFwvrjqyK0MwJ53FlCfT78J4xz6RGkcEX5e+OYlagAAgYGZg+Pnh91FBdaS6uVa/yxt1yuvC1IBkQq8cVHb3WHVtNiuV9whyUv+VvR1cT8yt2raLtc4fLwL+XA5m14AXJKgotYAoKxXliCZ3G9QNS2Wsymfuxyyy1vdSbhxB3SvzLZltxEwlgVM4whFrZHk5VVw1bRI8hJFrZHGkRVzDgegG1HyGqSjXp5zODDUa82toSH9N30DL+eq7oMXmywAAAAASUVORK5CYII=",0,10,10);
	
	global.select = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAYAAADzoH0MAAABAklEQVQ4jcWUIQ7CMBSGv5L6egxIJGGKLCS4IVAcAQ7AAdA7wA7AjoCaQJIQgoIQDBbFNUBtdKOvDBD8qm3e/72X99oqY6I7P0gBXoAxkRegT7vMG9ANx16QzheHzcoZkCeQQGoZT+8AwXDiBNjgYDihG45LEC0ZbZOvyqICyeSSXYWzAlcmCapOu6zWPahCZ4sUY6LnFN7ptYIUgEZdgKT/A/QnHXcCZou02OTjSGPZUIWXXqNrnspaL+Mp8BwhfNED2wzQyKnVbFL2qvR5e2E+6gOQrPcvEMlYJJmP+h99acl6D/BdD47XG4NOq3Smj9cbAL12UzT5VDymd4GSfr7KDxojUGvwPuaDAAAAAElFTkSuQmCC",0,0,0);
	
	global.ultra = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAADAAAAAgCAIAAADbtmxLAAAACXBIWXMAAAsSAAALEgHS3X78AAADB0lEQVRYhc2XP2haQRzHfxcc3JIQIiVvME0LaZKhrwk0KJQ2m9WWQrPp9jKEgNSxQ+cMjpYsHeJWNwOBxrrFUohkiLho69BUoc8WodjR7Tr89Lycv3d5Jsb2y0PO8+fdx9+f+50MZiNAyWjlbF/YaOVsxl99fGZN7uD82XGWtHfS2sYmDv5k3j/Zy3CTMTvMjdzd8nPSfoKcnbl9q8t0PRr5K1PRWCEeZWXOjRwArEwvk/ZM9pDRynXWLRx7T9NIc7/kw5nGeQ0A/AuLLlHQHiW+dednB/30ovEaZw79SdlbHnIt72lajIXPAbJO25Ao8qdy4ASHYJLV9xCGSQC5CZaAE3trvDiYTDJQpV3FwYRCI/tGyCl1/AuL+DTOa/jgW9KYXOTQn8SBSCkPXPQNUO65VIqHQJtqU9FYAYDtZbiZlOdXppcr7SqdQ7KGqiw92dlxVspIWn0gESybcfcEVyNDsTLnJsOoiXxiMw+3ZCAM1tunHy7dcn/X0ny69YbIRUWFeBSzWwa6EDKkAQB8tSZ3NPHSb6nBXdvYFMVfiEdZj4kAQrnMZb2H9JqKxnAgyIS6ZU9W1hUahRvJy4p+Iuqf7mX/UF2gzrplcOYml0cu5dT+Xz0EPSeZQfp6dEMygxGlqakeGicT0iiTdOvQMA1b7Q7HleMZpgJh3yifHEGvPpUV3RzBGuHvwY5mBiPYPWSDfsjwKNpOBMglBmVwJj/cvPBoaGQdLPnkQwiUgxFpthOBMaSRGYwcLPkGmdSQeWsAAIlQn2l/19rfta4ZKei5p7dOOhEKfAIAgMeNb7KZ5/f3X8oFDQBK9eaje34cO6HYjBucDg0rExcYXEcsW6o3V+fnFJtKu8pgNoJAGLVEKFCqNx1+JHz+2lBmBNOPB440AmJQq/NzqXxRHEWuboxOSyOcuM0xZ8uh5AEAMmpDwY1E+MeDqLLB0N6QcCOlyojmqsmh0YrcqAtk+8IGZ+9SRRi7h15+aXGTiX/TqodS+eJ4aJy2U4HKJ0epfHEMTsKCx6Yp6y8s1ojaIyxj7QAAAABJRU5ErkJggg==",2,12,16);
	
	// I'm only using one ultra icon since you can only really have one ultra
	global.ultra_icon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAACXBIWXMAAAsSAAALEgHS3X78AAABaElEQVQ4jY2UsW7CMBCGPyPUR2DpgtgzMERVotIBgcQLMDG0D8EahrDmHWiHTHmBSCCGUhFVGTpkRywsPEIH3IHacpyE9qRIPt/5838+5QQ3bLTvSNPf+GfRlFsbUICNf7b3G4HtOogCrLc7AN4/PgFY+nMzpwQTdZAgjHh6fNAQtVb+cjFntO+UlIkmiFJhQm7BhAmZTGe4Tr8RYJaZF1+kSaxhpTdynX6ppDozL0iTWK8rjz0eDlhvd42KVE4QRqW9ttkluHZqPBwAIEWL75dnAO5e3xDyonOU4o1/ZrTvSK3IcT2Wi3mjCluROlPkWbU0x/W47/aAa/1CXmC1KkEm0xkAp+OhXJrp3Hd7OkEdsE3FzVyw2m8q+stOxwNFnun2t8xgkWcVybcgppVAQRhR5BlpEtcCT8cDaRJT5Fml/dp+/3gZhJEMwkgCEpCO60nH9bRvxu0xU4H957MhlbnSeItl9hj5AVNy1gz9U3KBAAAAAElFTkSuQmCC",0,8,9);
#define race_name
return "Bandit";

#define race_mapicon
return global.mapicon;

#define race_menu_button
sprite_index = global.select;

#define race_text
return "Low Capacity#High Hopes"

#define race_swep
return 0;

#define race_portrait
	return global.portrait;
#define race_tb_text
return "Improved Bandit Blaster"

#define race_tb_take
	//
	
#define race_ultra_button 
	sprite_index = global.ultra;
	image_index = argument0 - 1;
#define race_ultra_name
switch (argument0) {
	case 1: return "High Capacity"; break;
	case 2: return "Big Bash"; break;
default: return "";
}

#define race_ultra_icon
	return global.ultra_icon;

#define race_ultra_text
switch (argument0) {
	case 1: if global.Ultra[1] <= 4 
				return "More Levelups"
			else return "Minor Buff to Bash Attack";
		/// Buff to Passive ability. Reduces your current level from 7 to 4 to gain 
		/// 5 more mutations in total. Current Rads are also reduced to 0.
	break;
	case 2: if global.Ultra[1] >= 2 return "Improved Bash attack"
				else return "Improved Bash Attack#Free Blaster Upgrade"
		/// Buff to Active ability. Functions exactly as Big Bandit's attack.
	break;
	default: return "";break;
}

#define race_ultra_take
	switch(argument0){
		case 1:
			if global.Ultra[1] <= 3 {
				GameCont.level = max(2 - instance_number(Player),1) + global.Ultra[1];
				GameCont.rad = 0;
				GameCont.skillpoints = 0;
				ultra_set(mod_current,1,0);
			}else{
				dmg_bash_base = 6;
			}
		break; 
		case 2:
			dmg_bash_base = 24;
		break;
	}
	global.Ultra[argument0] ++;

#define race_ttip
return choose("FHO'FAASHYN");

#define obj_create
	// obj_create(x,y)
	// type added when necessary, but only when
	// (it is not necessary here)
	ID = instance_create(argument0,argument1,CustomObject);
	with(ID){
		on_step = script_ref_create(bullet_step);
		on_draw = script_ref_create(bullet_draw);
		on_destroy = script_ref_create(bullet_destroy);
		
	if skill_get(17) = 0{
		col1 = make_color_rgb(165,25,60)
		col2 = make_color_rgb(252,56,0)
		col3 = make_color_rgb(255,133,99)
		col4 = c_white;
	}else{
		col1 = make_color_rgb(60,25,165)
		col2 = make_color_rgb(0,56,252)
		col3 = make_color_rgb(99,133,255)
		col4 = c_white;
		
		if random(10) < 1{
			with(instance_create(x+4-random(8),y+4-random(8),PortalL)){
				depth = other.depth + choose(1,-1,-1);
				image_blend = c_aqua;
			}
		}
	}
		len = 0;
		lifetime = 0;
		queuedestroy = 0;
		recycled = 0;
		if skill_get(15) bounce = 3 else bounce = 0;
	}
	return ID;
	
#define bullet_step
	if instance_exists(self){
		lifetime+=current_time_scale;
		if lifetime > 30*6 queuedestroy = 1;
		if speed > 6 speed -= 0.25;
		var nearestEnemy = instance_nearest(x,y,enemy);
		if place_meeting(x+hspeed,y+vspeed,Wall){//collision_point(x+hspeed,y+vspeed,Wall,0,1){
			if bounce > 0{
				direction = (direction + 180 + 45 - random(90)) mod 360;
				bounce--;
				if bounce <= 0 queuedestroy = 1;
			}else{
				instance_create(x,y,EBulletHit);
				queuedestroy = 1;
			}
			x -= hspeed;
			y -= vspeed;
		}
		if place_meeting(x,y,hitme){//collision_circle(x,y,6,hitme,0,1){
			var targ = collision_circle(x,y,6,hitme,0,1);
			if instance_exists(targ) && targ.team != team{
				if skill_get(16) = 1 && targ.my_health - dmg <= 0{
					queuedestroy = 0;
					if instance_exists(enemy){
						var nearestEnemy = instance_nearest(x,y,enemy);
						//direction = point_direction(x,y,nearestEnemy.x,nearestEnemy.y);
						speed = 10;
						sound_play(sndExplosion)//sndRecGlandProc);
						recycled = 1;
					}
				}else queuedestroy = 1;
				with(targ){
					my_health -= other.dmg;
					sprite_index = spr_hurt;
					image_index = 0;
					sound_play(snd_hurt);
				}
			}
		}
		if ((skill_get(19) && distance_to_object(enemy) < 56) || recycled = 1) && instance_exists(enemy){
			var aimDir = point_direction(x,y,nearestEnemy.x,nearestEnemy.y);
			var diff = cycle(aimDir - direction, -180, 180);
			if (abs(diff) < 2){
				direction = aimDir;
			}else{
				direction += diff * (0.20 + (0.10*recycled));
			}
		}
		if skill_get(21){
			if distance_to_object(enemy) < 32{
				var oldx = x;
				var oldy = y;
				move_snap(nearestEnemy.x,nearestEnemy.y);
				for(i=1;i<=10;i++){
					instance_create(x - (x - oldx) / i,y - (y - oldy)/i,DiscTrail);
					if skill_get(17) with(instance_create(x - (x - oldx) / i,y - (y - oldy)/i,PortalL)) image_blend = c_aqua;
				}
			}
		}
		if queuedestroy = 1{
			if skill_get(17) = 1{
				{
					with(instance_create(x,y,Lightning)){
						ammo = 1 + random(2);
						direction = random(360);
						alarm0 = 1;
						dmg = 1;
						damage = 1;
						team = other.team;
					}
				}
			}
			instance_destroy();
		}
	}
#define bullet_draw
	if distance_to_object(Player) < 200{
	draw_set_alpha(0.1);
	draw_set_color(col1);
		draw_circle(x,y,10,0);
	draw_set_color(col2);
		draw_circle(x,y,9,0);
	draw_set_color(col3);
		draw_circle(x+lengthdir_x(2,direction),y+lengthdir_y(2,direction),9,0);
	draw_set_color(col4);
		draw_circle(x+lengthdir_x(2,direction),y+lengthdir_y(2,direction),8,0);
	draw_set_alpha(1);

	draw_set_color(col1);
		draw_circle(x,y,6,0);
	draw_set_color(col2);
		draw_circle(x,y,5,0);
	draw_set_color(col3);
		draw_circle(x+lengthdir_x(2,direction),y+lengthdir_y(2,direction),5,0);
	draw_set_color(col4);
		draw_circle(x+lengthdir_x(2,direction),y+lengthdir_y(2,direction),4,0);
	}else exit;
#define bullet_destroy
	//derp
#define create
	if global.Ultra[2] = 1{
		dmg_bash_base = 24;
	}else{
		dmg_bash_base = 4;
	}
	
	bandit_reloadTime = 0;
	bandit_burstRepeat = 0;
	bandit_rushTime = 0;
	bandit_rushSpd = 0;
	bandit_time = 0;
	armLength = 0;
	
	if global.holiday = 0{
		spr_idle = sprBanditIdle;
		spr_walk = sprBanditWalk;
		spr_hurt = sprBanditHurt;
		spr_dead = sprBanditDead;
	}else if global.holiday = 1{
		spr_idle = sprSpookyBanditIdle;
		spr_walk = sprSpookyBanditWalk;
		spr_hurt = sprSpookyBanditHurt;
		spr_dead = sprSpookyBanditDead;
	}else{
		spr_idle = sprSnowBanditIdle;
		spr_walk = sprSnowBanditWalk;
		spr_hurt = sprSnowBanditHurt;
		spr_dead = sprSnowBanditDead;
	}
	
	snd_hurt = sndBanditHit;
	snd_dead = sndBanditDie;
	snd_lowh = sndBanditHit;
	snd_lowa = sndBanditHit;
	
	snd_wrld = sndSkillPick;
	
	snd_cptn = sndSkillPick;
	snd_thrn = sndSkillPick;
	snd_valt = sndSkillPick;
	snd_wrld = sndSkillPick;
	snd_chst = sndSkillPick;
	snd_spch = sndSkillPick;
	snd_idpd = sndSkillPick;
	
	maxhealth = 4;
	healthlock = maxhealth;
	
#define scrBanditFire
	var obj;
	var dir = point_direction(x,y,mouse_x[index],mouse_y[index]) + sin(bandit_time);
	ID = obj_create(x + lengthdir_x(armLength,gunangle),y + lengthdir_y(armLength,gunangle));
	ID.direction = dir;
	ID.speed = 6;
	ID.team = team;
	ID.dmg = 3 + (GameCont.level * 0.50) - 0.50;
	ID.mask_index = sprEnemyBullet1
	wkick = 8;
	
	if bandit_burstRepeat > 0{
		bandit_reloadTime = 5
	}else{
		bandit_reloadTime = 15;
	}
	if skill_get(22) = 1{
		bandit_reloadTime = max((bandit_reloadTime * (((my_health * 100)/maxhealth)/100) * current_time_scale),4);
	}
	sound_play(sndEnemyFire)
	
#define cycle
    /// cycle(value, min, max)
	/// Thanks yal
    var result, delta;
    delta = (argument2 - argument1);
    result = (argument0 - argument1) mod delta;
    if (result < 0) result += delta;
    return result + argument1;
	
#define game_start
	global.Ultra[1] = 0;
	global.Ultra[2] = 0;
#define step
	if skill_get(13) && button_check(index,"pick"){
		armLength = round(point_distance(x,y,mouse_x[index],mouse_y[index])/5);
	}
	if skill_get(23) = 1{
		with(enemy){
			if my_health <= 1{
				other.bandit_reloadTime *= 0.50;
				instance_destroy();
			}
		}
	}
	if skill_get(17) = 1 && random(10) < 1{
		with(instance_create(x+sprite_get_width(sprite_index)/2-random(sprite_get_width(sprite_index)),y+sprite_get_height(sprite_index)/2-random(sprite_get_height(sprite_index)),PortalL)){
			depth = other.depth + choose(1,-1);
			image_blend = c_aqua;
		}
	}
	/// Local replacement for current_time
	bandit_time+=current_time_scale;
	if bandit_time > 360 bandit_time = 0;
	if bandit_rushTime > 0 bandit_rushTime-=current_time_scale;
	
	// Max level cap. Increased with more players.
	if GameCont.level > 5 + instance_number(Player) && GameCont.level < 10{//1P: 7, 2P: 8
		GameCont.level = 10;
		GameCont.endpoints = 1;
	}
	/// Assumed to have restarted your run, resets stats
	/// Temporary fix until yal fixes this
	
	if my_health > healthlock{
		if bandit_rushTime <= 0{
			healthlock = my_health;
		}else{
			if !(my_health > healthlock){
				my_health = healthlock;
			}else healthlock = my_health;
		}
	}
		
	/// One curse, on the house ;)
	if GameCont.crown = 11
		curse = 1;
	if (curse = 1){
		if random(10)<3{
			var width = sprite_get_width(sprite_index)/2;
			var height = sprite_get_height(sprite_index)/3;
			with(instance_create(x+width-random(width*2),y+height-random(height*2),Curse)){
				depth = choose(3,-3,-3)
			}
		}
	}
	
	if bandit_reloadTime > 0 bandit_reloadTime-=current_time_scale;
	//Firing
	if button_check(index,"fire") && bandit_reloadTime <= 0{
		bandit_burstRepeat = 0 + (skill_get(5) * 2) + global.Ultra[2];
		scrBanditFire();
	}
	if bandit_burstRepeat > 0 && bandit_reloadTime <= 1{
		bandit_burstRepeat--;
		scrBanditFire();
	}
	
	//Special
	if button_pressed(index,"spec") && bandit_rushTime <= 0{
		bandit_rushTime = 25;
	}
	
	if (bandit_rushTime > 0){
		sprite_index = spr_walk;
		var ratio = ((bandit_rushTime * 100)/25)/175;
		image_blend = make_color_rgb(255,255*ratio,255*ratio);
		if bandit_rushTime < 15{
			speed = bandit_rushSpd + (skill_get(14) * 2);
			if skill_get(14) = 1 && bandit_rushTime < 12{
				with(instance_create(x,y,Flame)){
					team = other.team;
				}
			}
			if collision_circle(x+lengthdir_x(8,direction),y+lengthdir_y(8,direction),4,Wall,0,1) && bandit_rushSpd > 3{
				with(collision_circle(x+lengthdir_x(8,direction),y+lengthdir_y(8,direction),4,Wall,0,1)){
					if global.Ultra[2] = 0{
						with(other){
							direction += 180 - 15 + random(30);
							bandit_rushSpd = 3;
						}
					}
					instance_create(x,y,FloorExplo);
					instance_destroy();
				}
			}
			if collision_circle(x,y,16,hitme,0,1){
				with(collision_circle(x,y,16,hitme,0,1)){
					if (team != other.team && (sprite_index != spr_hurt || (sprite_index = spr_hurt && image_index > 1))){
						my_health -= other.dmg_bash_base + floor(GameCont.level * 0.5);
						sprite_index = spr_hurt;
						image_index = 0;
					}
				}
			}
		}else if bandit_rushTime > 15{
			speed *= 0.50;
		}else{
			direction = point_direction(x,y,mouse_x[index],mouse_y[index]);
			bandit_rushSpd = 6;
		}
	}else{
		image_blend = c_white;
	}
	if bandit_rushTime > 15{
		healthlock = my_health;
	}else{
		if bandit_rushTime > 0 my_health = healthlock;
	}
	
	//Discards weapon
	if (wep != 0){//weapon_get_name(0)
		with(instance_create(x,y,ThrownWep)){
			wep = other.wep//weapon_get_name(other.wep);
			team = other.team;
			direction = point_direction(x,y,mouse_x[other.index],mouse_y[other.index]);
			speed = 6;
			team = other.team;
			sprite_index = weapon_get_sprite(other.wep)
			other.wep = 0;
		}
	}
	
#define draw
	with(PlayerSit) visible = 0;
	with(SitDown) visible = 0;
	if instance_exists(PlayerSit) sprite_index = spr_idle;
	draw_primitive_begin(pr_trianglefan);
		draw_set_color(c_black)
		draw_vertex(x,y - lengthdir_y(4,aimDirection) - 1);
		draw_vertex(x,y - lengthdir_y(4,aimDirection) + 3);
		draw_vertex(x-lengthdir_x(wkick - armLength,aimDirection),y - lengthdir_y(wkick - armLength,aimDirection) + 3)
		draw_vertex(x-lengthdir_x(wkick - armLength,aimDirection),y - lengthdir_y(wkick - armLength,aimDirection) - 1)
		draw_vertex(x,y-lengthdir_y(4,aimDirection) - 1);
		draw_vertex(x,y-lengthdir_y(4,aimDirection) + 3);
		draw_set_color(make_color_rgb(157,133,98));
		draw_vertex(x,y - lengthdir_y(4,aimDirection));
		draw_vertex(x,y - lengthdir_y(4,aimDirection) + 2);
		draw_vertex(x-lengthdir_x(wkick - armLength,aimDirection),y - lengthdir_y(wkick - armLength,aimDirection))
		draw_vertex(x-lengthdir_x(wkick - armLength,aimDirection),y - lengthdir_y(wkick - armLength,aimDirection) + 2)
		draw_vertex(x,y-lengthdir_y(4,aimDirection) + 2);
		draw_vertex(x,y-lengthdir_y(4,aimDirection));
	draw_primitive_end();
	draw_set_color(c_white);
	if back = 1{
		draw_sprite_ext(sprBanditGun,0,x-lengthdir_x(wkick - armLength,aimDirection),y-lengthdir_y(wkick - armLength,aimDirection),1,right,aimDirection,image_blend,1)
	}
	draw_sprite_ext(sprite_index,-1,x,y,right,1,angle,image_blend,1)
	if back = -1
	draw_sprite_ext(sprBanditGun,0,x-lengthdir_x(wkick - armLength,aimDirection),y-lengthdir_y(wkick - armLength,aimDirection),1,right,aimDirection,image_blend,1)