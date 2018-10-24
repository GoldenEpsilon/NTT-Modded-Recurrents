#define init 
	global.gce = 0;
	global.loops = 0;
	if array_length_1d(instances_matching(CustomEnemy,"name","freakcont")) > 0{
		arena_create();
	}
	init_part2();
	
#macro mode_freak 0
#macro mode_idpd 1
#macro mode_palace 2
#macro mode_sewer 3
	
#define init_part2
	// For some reason, defining multiple macros before init is causing the mod to not work
	// Therefore, this is necessary(?)
	global.namelist = ds_map_create();
	var nl = global.namelist;
	nl[? mode_freak] = "THUNDERDOME";
	nl[? mode_idpd] = "STING OPERATION";
	nl[? mode_palace] = "RADIOACTIVE REGALIA";
	nl[? mode_sewer] = "THE UNDERBELLY";

#define game_start 
	wait 5;
	sound_stop_all();
	sound_loop(amb0);
#define range 
	if argument0 >= argument1 && argument0 <= argument2{
		return true;
	}else return false;
	
#define mutator_create
	with(instance_create(argument0,argument1,CustomObject)){
		var d = 0;
		muts = [];
		for(var i = 0;i<=28;i++){
			if !skill_get(i){
				muts[d] = i;
				d++;
			}
		}
		if array_length_1d(muts) = 0{
			muts[0] = mut_last_wish;
		}
		mut = muts[irandom_range(1,array_length_1d(muts)-1)];
		timer = 30;
		sprite_index = sprSkillIcon
		image_index = mut;
		image_speed = 0;
		z = 1;
		zspd = 20;
		on_step = script_ref_create(mutator_step);
	}
#define mutator_step
	if abs(image_xscale) < 0.05{
		var d = 0;
		do{
			mut = muts[irandom_range(1,array_length_1d(muts)-1)];
			if skill_get(mut) = 0{
				break;
			}
			d ++;
		}until d >= 29;
		if d = 29 mut = mut_last_wish;
		
		timer = 30;
		image_index = mut;
	}
	image_xscale = 0.75 * sin(current_frame/10);
	image_yscale = 0.75;
	if current_time mod 30 = 0{
		var wid = sprite_get_width(sprite_index) * image_xscale,hig = sprite_get_height(sprite_index) * image_yscale;
		with(instance_create(x + random_range(wid/-2,wid/2),y+random_range(hig/-2,hig/2),CaveSparkle)) depth = other.depth - choose(1,-1)
	}
	if z > 16 mask_index = mskNone
		else mask_index = sprSkillIcon;
	if z + zspd > 0{
		zspd -= 0.5;
	}else{
		z = 0;
		zspd *= -0.33;
	}
	z += zspd;
	y = ystart - z;
	with(Player){
		if place_meeting(x,y,other) && button_pressed(index,"pick"){
			skill_set(other.mut,1);
			sound_play(sndMutLastWish);
			var _mut = other.mut,_other = other;
			instance_create(x,y,RoguePickup);
			with(instances_matching_ne(CustomObject,"mut",undefined)){
				muts = [];
				var d = 0;
				for(var i = 1;i<=28;i++){
					if !skill_get(i){
						muts[d] = i;
						d++;
					}
				}
				if mut = _mut{
					with(instance_create(x,y,RecycleGland)){
						sprite_index = sprShieldDisappear;
						image_index = 2;
					}
					if array_length_1d(muts) > 0{
						mut = muts[irandom_range(1,array_length_1d(muts) - 1)]
					}else mut = mut_last_wish;
					image_index = mut;
				}
				if self = _other instance_delete(self);
			}
		}
	}
#define deletestage
	with(Floor) instance_destroy();
	with(Wall) instance_destroy();
	with(Top) instance_destroy();
	with(TopSmall) instance_destroy();
	with(TopPot) instance_destroy();
	with(Bones) instance_destroy();
	with(Detail) instance_destroy();
	with(enemy){
		if object_index != CustomEnemy{
			instance_change(Wind,false);
		}else{
			if ("donotdelete" not in self)
				instance_destroy();
		}
	}
	with(BecomeNothing2) instance_change(Wind,false);
	with(prop) instance_change(Wind,false);
	with(Portal) instance_change(Wind,false);
	wait 1;
	with(IDPDSpawn) instance_destroy();
	
#define statue_dead
	with(instance_create(x,y,Explosion)){
		team = 2;
	}
	repeat(3){
		with(instance_create(x,y,BigRad)){
			speed = 3 + random(3);
			direction = random(360);
		}
	}
	repeat(12){
		with(instance_create(x,y,Rad)){
			speed = 3 + random(3);
			direction = random(360);
		}
	}
	if name = "slave"{
		switch(irandom(12)){
			case 0:
			case 1:
			case 2:
			case 3:
				campfire_show_message("INFINITE AMMO! USE IT WISELY...");
				with(Player) infammo = 30 * 7;
			break;
			case 4:
			case 5:
			case 6:
				campfire_show_message("RACING MIND! SWING LIKE A MADMAN!");
				with(instances_matching(CustomEnemy,"name","freakcont")) quickload = 30 * 7;
			break;
			case 7:
			case 8:
				campfire_show_message("A LIMITED TIME OFFER FROM THE GUN GOD!");
				with(instance_create(10016,10016 + 32,WepPickup)){
					repeat(32){
						with(instance_create(x,y,Dust)){
							direction = random(360);
							speed = 3 + random(2);
						}
					}
					wep = wep_golden_nuke_launcher;
				}
			break;
			case 9:
			case 10:
				campfire_show_message("INFINITE HEALTH! @qT@qI@qM@qE@q@qT@qO@q@qL@qE@qT@q@qL@qO@qO@qS@qE@q!@q!@q!")
				with(instances_matching(CustomEnemy,"name","freakcont")) infhp = 30 * 7;
			break;
			case 11:
			case 12:
				campfire_show_message("AN UNEXPECTED ALLY!")
				lilhunter_create();
			break;
		}
		with(instances_matching(CustomEnemy,"name","slave")) my_health = 250;
	}
	
#define lilhunter_create
	with(instance_create(10016,10016,CustomHitme)){
		name = "customhunter";
		
		// Sprites
		spr_idle = sprLilHunterWalk;
		spr_walk = sprLilHunterWalk;
		spr_hurt = sprLilHunterHurt;
		spr_dead = sprLilHunterDead;
		spr_gunn = sprLilHunterGun2;
		sprite_index = spr_idle;
		friction = 0.40;
		image_speed = 0.40;
		
		snd_woao = sndLilHunterLaunch;
		snd_land = sndLilHunterLand;
		snd_hurt = sndLilHunterHurt;
		snd_dead = sndLilHunterDeath;
		
		// Max values
		maxspeed = 3;
		maxhealth = 100;
		maxrange = 200;
		minrange = 84;
		
		// Enemy values
		my_health = maxhealth;
		gunangle = random(360);
		aimtarget = -1;
		team = 2;
		walk = 0;
		fly = 1;
		canfly = true;
		ded = 0;
		bounce = 0;
		
		// Misc values
		right = 1;
		depth = -2;
		
		// alrm0: walking
		// alrm1: aimtargeting
		// alrm2: firing
		alrm0 = 30;
		alrm1 = 120;
		alrm2 = 0;
		
		z = 0;
		zspd = 0;
		
		on_hurt = lilhunter_hurt;
		on_step = lilhunter_step;
		on_draw = lilhunter_draw;
		
		return self;
	}

#define lilhunter_hurt 
	sprite_index = spr_hurt;
	image_index = 0;
	sound_play(snd_hurt);
	
	my_health -= argument0;
	motion_add(argument2,argument1);
	
	if my_health <= 0 && ded = 0{
		sound_play(sndLilHunterBreak);
		ded = 1;
		speed = 4;
	}
#define hunter_aimtarget
	// Edit this as you see fit to match the complexity of your enemy
	if !is_array(argument0){
		if instance_exists(argument0){
			return instance_nearest(x,y,argument0);
		}else return -4;
	}else{
		var dist = 10000,obj = -4;
		with(argument0){
			if point_distance(x,y,other.x,other.y) < dist{
				dist = point_distance(x,y,other.x,other.y);
				obj = self;
			}
		}
		return obj;
	}
	
#define lilhunter_step
	if !(ded){
		// Event 0: Used for walking here.
		if (alrm0 > 0){
			if z = 0 alrm0 -= current_time_scale;
			if alrm0 <= 0{
				if instance_exists(aimtarget){
					if distance_to_object(aimtarget) < maxrange{
						direction = point_direction(x,y,aimtarget.x,aimtarget.y) + random_range(-30,30);;
					}else{
						if random(10) < 1 + (4 * (my_health/maxhealth)) && z = 0{
							fly = 1;
							sound_play(snd_woao);
						}else direction = point_direction(x,y,aimtarget.x,aimtarget.y) + random_range(-30,30);
					}
				}else{
					direction = random(360);
					gunangle = direction;
				}
				
				// Do these regardless of aimtarget-related variables
				walk = 15 + irandom(30);
				alrm0 = walk + 10 - irandom(12);
			}
		}
		
		// Event 1: Used for aimtargeting and priming its weapon
		if (alrm1 > 0){
			if z = 0 alrm1 -= current_time_scale;
			if alrm1 <= 0{
				aimtarget = hunter_aimtarget(instances_matching_ne(enemy,"team",0));
				if instance_exists(aimtarget) && aimtarget != -4{
					// Shooting
					if random(2) < 1{
						gunangle = point_direction(x,y,aimtarget.x,aimtarget.y);
						instance_create(x,y,AssassinNotice);
						alrm2 = 10;
						alrm1 = -1;
						walk = 0;
					}
				}
				alrm1 = 10;
			}
		}
		
		// Event 2: Firing the weapon
		if (alrm2 > 0){
			if z = 0 alrm2 -= current_time_scale;
			if alrm2 <= 0{
				if instance_exists(aimtarget) && aimtarget != -4{
					if distance_to_object(aimtarget) < minrange{
							repeat(8){
							with(instance_create(x,y,EnemyBullet1)){
								creator = other.id;
								team = other.team;
								speed = 8 + random(4);
								direction = other.gunangle;
								image_angle = direction;
							}
						}
						sound_play(sndLilHunterSniper);
						alrm2 += 8;
					}else{
						player_fire_ext(gunangle, wep_bouncer_shotgun,x,y,team,self);
						alrm2 += weapon_get_load(wep_bouncer_shotgun);
					}
					walk = 0;
				}else alrm1 = 30;
			}
		}
		
		if (walk > 0){
			walk -= current_time_scale;
			speed += 1;
		}else{
			if speed > 0 speed *= 0.90
				else speed = 0;
		}
		speed = clamp(speed, 0, maxspeed);
		
		// Animation handler
		if speed > 0.10 && sprite_index != spr_hurt
			sprite_index = spr_walk;
		if (image_index + image_speed >= image_number){
			if sprite_index = spr_hurt || sprite_index = spr_walk{
				if abs(speed) < 0.10 sprite_index = spr_idle;
					else sprite_index = spr_walk;
			}
			image_index = 0;
		}
		
		if fly = 1{
			if zspd != 7{
				zspd = 7;
				sound_play(snd_woao);
			}
			if z >= 256 fly = -1;
			mask_index = mskNone;
		}else{
			if zspd != -7 && z != 0{
				mask_index = mskLilHunter;
				var i = irandom(instance_number(Floor));
				with(Floor){
					i --;
					if i <= 0{
						other.x = x + 16;
						other.y = y + 16;
						break;
					}
				}
				zspd = -7;
			}
			if z + zspd <= 0 && z != 0{
				zspd = 0;
				z = 0;
				fly = 0;
				sound_play(snd_land);
				for(var i = 0;i<=32;i++){
					with(instance_create(x,y,TrapFire)){
						direction = (360/32) * i;
						team = 2;
						speed = 3;
						sprite_index = sprFireLilHunter
					}
				}
			}
		}
		z += zspd;
	}else{
		sprite_index = spr_hurt;
		image_index = min(image_index,image_number - 1);
		speed = 8;
		direction += 5 * right;
		image_angle = direction - 90;
		instance_create(x,y,Smoke)
		if place_meeting(x,y,CustomEnemy) && image_index = image_number - 1{
			direction += 90 * right;
			image_index = 0;
			bounce ++;
			if bounce > 5{
				repeat(3){
					with(instance_create(x,y,Explosion)) team = 2;
					sound_play(snd_dead);
					with(instance_create(x,y,Corpse)) sprite_index = other.spr_dead;
				}
				instance_delete(self);
			}
		}
	}
#define lilhunter_draw
	// Flips the sprite based on aim direction
	if (((gunangle+270) mod 360)>180) right = 1 else right = -1;
	var _flip = fly;
	if fly = 0 _flip = 1;
	// Draws sprites
	if gunangle < 180 draw_sprite_ext(spr_gunn,0,x,y-z,1,1*right,gunangle,image_blend,1);
	draw_sprite_ext(sprite_index,image_index,x,y-z - 4,right,1 * _flip,image_angle,image_blend,1);
	if gunangle >= 180 draw_sprite_ext(spr_gunn,0,x,y-z,1,1*right,gunangle,image_blend,1);
		
#define campfire_step
	with(instances_matching(PopoFreak,"kills",0)){
		kills = 1;
	}
	with(Player){
		if "wepinfo" not in self{
			wepinfo = [wep,bwep];
			timer_godblessing = -1;
		}
		if wep != wep_golden_nuke_launcher && ((race != "chicken" && my_health <= 0) || (race = "chicken" && bleed >= 120)){
			wepinfo = [wep,bwep,skill_get(mut_boiling_veins)];
		}
		if skill_get(mut_boiling_veins) && wep != wep_golden_nuke_launcher wepinfo[3] = 1
			else wepinfo[3] = 0;
		if other.quickload > 0 || wep = wep_golden_nuke_launcher{
			reload = min(reload,weapon_get_load(wep)/5);
		}
		if other.infhp > 0{
			nexthurt = current_frame + 5;
			my_health = max(my_health,1);
		}
		if wep = wep_golden_nuke_launcher{
			if timer_godblessing = -1{
				timer_godblessing = 30 * 15;
				canpick = false;
				bwep = 0;
				skill_set(mut_boiling_veins,1);
				sound_play(sndVenuz);
			}else{
				infammo = 2;
				timer_godblessing -= current_time_scale;
				if timer_godblessing <= 0{
					timer_godblessing = -1;
					canpick = true;
					wep = lastwep[0];
					bwep = lastwep[1];
					skill_set(mut_boiling_veins,wepinfo[3]);
					reload = weapon_get_load(wep);
					sound_play(sndMutant6Dead);
					repeat(32){
						with(instance_create(x,y,Dust)){
							direction = random(360);
							speed = 3 + random(2);
						}
					}
				}
			}
		}else{
			if timer_godblessing != -1{
				timer_godblessing = -1;
				canpick = true;
				wep = wepinfo[0];
				bwep = wepinfo[1];
				skill_set(mut_boiling_veins,wepinfo[3]);
			}
		}
	}
	if quickload > 0{
		quickload -= current_time_scale;
	}
	if infhp > 0{
		infhp -= current_time_scale;
	}
	for(var i = 0;i<=7;i++){
		if !instance_exists(slave[i]){
			timer_purchaseslaves -= current_time_scale;
			if !(active) || timer_purchaseslaves <= 0{
				slave[i] = instance_create(0,0,CustomEnemy)
				with(slave[i]){
					spr_idle = sprThroneStatue;
					spr_hurt = sprThroneStatue;
					spr_dead = sprThroneStatueDead;
					sprite_index = spr_idle;
					my_health = 250;
					size = 10;
					candie = true;
					canfly = true;
					team = 0;
					name = "slave";
					on_death = script_ref_create(statue_dead);
				}
				timer_purchaseslaves = 30 * 30;
			}
		}else{
			with(slave[i]){
				var _mod = 0.75,dirmod = 0.75;
				x = other.x + lengthdir_x(84 * 2 * _mod,((360/8) * i) + ((current_frame/4)) * dirmod);
				y = other.y + lengthdir_y(64 * 2 * _mod,((360/8) * i) + ((current_frame/4)) * dirmod);
			}
		}
	}
	for(var i = 8;i<array_length_1d(slave);i++){
		if !instance_exists(slave[i]){
			if !(active){
				slave[i] = instance_create(0,0,CustomEnemy)
				with(slave[i]){
					spr_idle = sprThroneStatue;
					spr_hurt = sprThroneStatue;
					spr_dead = sprThroneStatueDead;
					sprite_index = spr_idle;
					my_health = 200;
					size = 10;
					candie = true;
					canfly = true;
					team = 0;
					name = "slavewall";
					on_death = script_ref_create(statue_dead);
				}
			}
		}else{
			with(slave[i]){
				_mod = 1.5;
				dirmod = -4//-15;
				ii = i/(array_length_1d(other.slave)-8);
				x = other.x + lengthdir_x(72 * 2 * _mod,(360* ii) + (current_frame/4) * dirmod);
				y = other.y + lengthdir_y(56 * 2 * _mod,(360* ii) + (current_frame/4) * dirmod);
			}
		}
	}
	if my_health < maxhealth my_health = maxhealth;
	x = xstart + 16;
	y = ystart + 16;
	with(Floor){
		if sprite_index != sprFloor6 sprite_index = sprFloor0;
	}
	with(Player){
		candie = false;
		if "temparray" not in self{
			temparray = [spr_idle,spr_walk,spr_hurt,spr_dead]
		}
		if GameCont.skillpoints > 0{
			repeat(GameCont.skillpoints) mutator_create(x,y);
			GameCont.skillpoints = 0;
		}
		if my_health <= 0 && canwalk = true{
			if (skill_get(mut_strong_spirit) = false || (skill_get(mut_strong_spirit) = true && nexthurt <= current_frame)) && (race != "chicken" || race = "chicken" && bleed >= 120){
				spr_idle = spr_dead;
				spr_walk = spr_dead;
				spr_hurt = spr_dead;
				sprite_index = spr_dead;
				mask_index = mskNone;
				sound_play(snd_dead);
				lastwep = [wep,bwep];
				wep = 0;
				bwep = 0;
				canwalk = false;
				canspec = false;
				canaim = false;
				reload = 9999;
				can_shoot = false;
				image_index = 0;
				rogueammo = 1;
				if array_length_1d(instances_matching(Player,"canwalk",true)) = 0{
					sound_stop_all();
					with(PopoFreak){
						alarm0 = 0;
						alarm1 = 0;
						alarm2 = 0;
						alarm3 = 0;
						alarm4 = 0;
					}
					if(fork()){
						wait (sprite_get_number(spr_dead)-1) / 0.40;
						image_speed = 0;
						wait 90;
						while(other.fade < 1){
							other.fade += 0.1;
							wait 1;
						}
						with(WantRevivePopoFreak) instance_delete(self);
						with(IDPDSpawn) instance_delete(self);
						with(CustomHitme) instance_delete(self);
						with(FrogEgg) instance_delete(self);
						with(instances_matching_ne(enemy,"name","freakcont")) instance_delete(self);
						sound_stop_all();
						x = other.x;
						y = other.y + 64;
						other.mask_index = mskPlayer;
						other.sprite_index = sprCampfire;
						GameCont.level = 1;
						GameCont.rad = 0;
						with(WepPickup) instance_destroy();
						with(Pickup) instance_destroy();
						with(projectile) instance_delete(self);
						with(CustomObject) instance_delete(self);
						with(Corpse) instance_destroy();
						with(Scorch) instance_destroy();
						with(ScorchTop) instance_destroy();
						for(var i = 0;i<=28;i++){
							skill_set(i,0);
						}
						while(other.fade > 0){
							other.fade -= 0.1;
							wait 1;
						}
						sound_loop(amb0);
						other.sprite_index = sprCampfire
						other.spawns = 0;
						other.loops = 0;
						campfire_show_message(string(GameCont.kills) + " FREAKS KILLED!");
						wait 30;
						with(Player){
							canwalk = true;
							canspec = true;
							canaim = true;
							canspirit = true;
							if race = "chicken" maxhealth = 8;
							mask_index = mskPlayer;
							my_health = maxhealth;
							spr_idle = temparray[0];
							spr_walk = temparray[1];
							spr_hurt = temparray[2];
							wep = lastwep[0];
							bwep = lastwep[1];
							ammo[weapon_get_type(wep)] = max(typ_ammo[weapon_get_type(wep)]*3,ammo[weapon_get_type(wep)]);
							ammo[weapon_get_type(bwep)] = max(typ_ammo[weapon_get_type(bwep)]*3,ammo[weapon_get_type(bwep)]);
							reload = weapon_get_load(wep);
							image_index = 0;
							image_speed = 0.40;
						}
						other.active = false;
						global.loops = 0;
						other.xoff = 1;
						exit;
					}
				}
			}
		}
	}
	with(projectile){
		if distance_to_object(other) > 500 instance_delete(self);
	}
	with(instances_matching_ne(hitme,"name","customhunter")){
		if !place_meeting(x+hspeed,y+vspeed+((sprite_get_width(sprite_index)/3)*sign(vspeed)),Floor){
			vspeed = 0;
		}
		if !place_meeting(x+hspeed+((sprite_get_height(sprite_index)/3)*sign(hspeed)),y,Floor){
			hspeed = 0;
		}
	}
	with(Corpse){
		if !place_meeting(x+hspeed,y+vspeed+((sprite_get_width(sprite_index)/3)*sign(vspeed)),Floor){
			vspeed = 0;
		}
		if !place_meeting(x+hspeed+((sprite_get_height(sprite_index)/3)*sign(hspeed)),y,Floor){
			hspeed = 0;
		}
	}
	if(active){
		if xoff > 0{
			xoff *= 0.8;
		}
		if (timer > 0){
			// Pause timer when a boss monster appears
			if array_length_1d(instances_matching_ne(enemy,"intro",undefined)) = 0{
				timer -= current_time_scale;
			}
			if timer <= 0{
				timer = 30 * 15;
				if mode = mode_freak{
					if spawns <= 0{
						repeat(3 + (instance_number(Player) - 1)){
							with(instance_create(x,y,RevivePopoFreak)){
								var cont = other;
								if(fork()){
									var _x = x;
									var _y = y;
									while(instance_exists(self)){
										wait 1;
										if !instance_exists(self){
											if cont.sprite_index = sprCampfireOff{
												instance_create(_x,_y,PopoFreak);
											}else{
												instance_delete(self);
												exit;
											}
										}
									}
									exit;
								}
							}
						}
						spawns ++;
					}else{
						with(instance_create(x,y,RevivePopoFreak)){
							repeat(2){
								if(fork()){
									var cont = other;
									with(instance_create(x,y,RevivePopoFreak)){
										if(fork()){
											var _x = x;
											var _y = y;
											while(instance_exists(self)){
												wait 1;
												if !instance_exists(self){
													if cont.sprite_index = sprCampfireOff{
														instance_create(_x,_y,PopoFreak);
													}else{
														instance_delete(self);
														exit;
													}
												}
											}
											exit;
										}
									}
								}
							}
						}
					}
				}else if mode = mode_idpd{
					spawns ++;
					if spawns mod 3 != 0{
						var imax = 5 + global.loops;
						for(var i = 1;i<imax;i++){
							wait max(5,15 - (2 * global.loops));
							with(instance_create(10016,10016,IDPDSpawn)){
								p = i;
								if i = 0 && random(30) < min(other.spawns/5,10) elite = 1;
								x = 10016;
								y = 10016;
								if(fork()){
									while instance_exists(self){
										wait 1;
										if !other.active instance_delete(self);
									}
									exit;
								}
							}
							with(IDPDSpawn){
								/// Sets their alarms to max so that they all come at once. Staggered spawns is solely for sake of audio effect.
								alarm0 = 43;
								other.timer = 30 * 7;
								if i = imax-1{
									direction = (360/(imax-1)) * p;
									speed = 1;
								}
							}
						}
					}else{
						campfire_show_message("A BOSS MONSTER APPROACHES!");
						if(fork()){
							while instance_exists(self){
								timer = 30 * 6;
								wait 1;
								if timer2 <= 0{
									with(instance_create(10016,10016,Last)){
										team = 3;
									}
									repeat(2 + global.loops){
										with(instance_create(x,y,IDPDSpawn)){
											wait 1;
											x = xstart;
											y = ystart;
										}
									}
									global.loops ++;
									break;
								}
							}
							exit;
						}
					}
				}else if mode = mode_palace{
					spawns ++;
					if spawns mod 10 = 0{
						campfire_show_message("BOSS MONSTERS APPROACH!");
						if(fork()){
							while instance_exists(self){
								wait 1;
								timer = 30 * 12;
								if sprite_index != sprCampfireOff || active = false exit;
								if timer2 <= 0{
									for(var o = -1;o<=1;o+=2){
										for(var i = -1;i<=1;i+=2){
											with(instance_create(10016 + (48 * i),10016 + (48 * o),CrownGuardian)){
												spr_idle = sprCrownGuardianAppear;
												sound_play(sndCrownGuardianAppear);
												canfly = true;
											}
										}
									}
									global.loops ++;
									exit;
								}
							}
							exit;
						}
					}else if spawns mod 7 = 0 || spawns mod 5 = 0{
						if (active){
							if random(10) < 1{
								with(instance_create(10016,10016,DogGuardian)){
									mask_index = mskNone;
									canfly = true;
									zz = 256;
									y = ystart - zz;
									if(fork()){
										while instance_exists(self){
											wait 1;
											y = ystart - zz;
											zz -= 8
											if zz <= 0{
												mask_index = mskDogGuardian;
												canfly = false;
												sound_play(sndWallBreakBrick);
												repeat(32){
													with(instance_create(x,y,Debris)){
														direction = random(360);
														vspeed = random_range(-4,4);
														hspeed = random_range(-8,8);
													}
												}
												exit;
											}
										}
										
									}
								}
							}else{
								repeat(2) instance_create(10016,10016,ExploGuardian);
							}
						}
					}
					// Spawn Guardians on all waves EXCEPT for Crown Guardian waves
					if spawns mod 10 != 0{
						if (active){
							repeat(6){
								repeat(2){
									with(instance_create(10016 + random_range(-64,64),10016 + random_range(-64,64),Guardian)){
										spr_idle = sprGuardianAppear;
										sound_play(sndGuardianAppear);
										canfly = true;
									}
								}
								wait 10;
								if !(active) break;
							}
						}
					}
				}else if mode = mode_sewer{
					spawns ++;
					timer = 30 * 6;
					if spawns mod 12 != 0{
						var cont = self;
						repeat(3 + loops){
							repeat(2){
								with(instance_create(10016 + random_range(-60,60),10016 + random_range(-60,60),FrogEgg)){
									alarm0 = 120;
									team = 0;
									if(fork()){
										var _x = x;
										var _y = y;
										while(instance_exists(self)){
											wait 1;
											cont.timer = 30;
											if !instance_exists(self){
												if random(8) < 3 instance_create(_x,_y,AmmoPickup);
												exit;
											}
											if alarm0 <= 5{
												if cont.sprite_index = sprCampfireOff{
													if random(3) < 2 obj = choose(Gator,Gator,Gator,Gator,Gator,Gator,Gator,Gator,Gator,Gator,GatorSmoke,GatorSmoke,SuperFireBaller)
														else obj = Exploder
													if obj = SuperFireBaller && instance_number(SuperFireBaller) > 1{
														obj = choose(Gator,GatorSmoke,GatorSmoke);
													}
													with(instance_create(_x,_y,obj)){
														//my_health *= 2;
													}
													sound_play(sndFrogEggOpen1);
													if random(8) < 1 instance_create(_x,_y,AmmoPickup);
													with(instance_create(_x,_y,Corpse)){
														sprite_index = other.spr_dead;
													}
													instance_delete(self);
													exit;
												}else{
													instance_delete(self);
													exit;
												}
											}
										}
										exit;
									}
								}
							}
							wait 15;
						}
					}else{
						campfire_show_message("A BOSS MONSTER APPROACHES!");
						loops ++;
						if(fork()){
							while instance_exists(self){
								timer = 30 * 12;
								wait 1;
								if timer2 <= 0{
									with(instance_create(10016,10016,FrogQueen)){
										//
									}
									break;
								}
							}
							exit;
						}
					}
				}
			}
		}
		// Creates raindrops
		var i = irandom(instance_number(Floor));
		with(Floor){
			i --;
			if i <= 0{
				instance_create(x + random(32),y+random(32),RainDrop);
				break;
			}
		}
	}
	
#define campfire_hit 
	if !(active){
		sound_stop_all();
		sound_play(sndCursedReminder);
		mask_index = mskNone;
		GameCont.kills = 0;
		with(Player){
			if my_health > 0{
				canwalk = true;
				canaim = true;
				canspec = true;
			}
			lastwep = [wep,bwep];
		}
		repeat(32){
			with(instance_create(x,y,Smoke)){
				direction = argument2 + random_range(-30,30);
				speed = 3 + random(3);
			}
		}
		sprite_index = sprCampfireOff;
		if(fork()){
			wait 90;
			var snd;
			switch(mode){
				case mode_freak:
					snd = musBoss1;
				break;
				case mode_idpd:
					snd = mus106;
				break;
				case mode_sewer:
					snd = musBoss5;
				break;
				default: 
					snd = musBoss1;
				break;
			}
			sound_loop(snd);
			active = true;
			timer = 30 * 3;
			timer_thunder = (30 * 3) + 20;
			exit;
		}
	}
	
#define campfire_show_message 
	with(instances_matching(CustomEnemy,"name","freakcont")){
		text2 = argument0;
		xoff2 = 1;
		timer2 = 90;
	}
	
#define campfire_draw
	draw_sprite(sprite_index,image_index,x,y);
	if sprite_index = sprCampfire{
		var nl = global.namelist;
		draw_set_halign(fa_center);
		with(Player){
			if "weppick" not in self weppick = 0;
			if distance_to_object(other) < 48{
				if button_released(index,"pick"){
					canwalk = false;
					canaim = false;
					canspec = false;
				}
				if !(canwalk){
					if button_pressed(index,"east"){
						weppick = (weppick + 1) mod array_length_1d(other.weps);
					}
					if button_pressed(index,"west"){
						weppick --;
						if weppick < 0
							weppick = array_length_1d(other.weps) - 1;
					}
					if button_pressed(index,"pick"){
						var _wep = other.weps[weppick];
						with(instance_create(x,y+84,WepPickup)){
							wep = _wep;
							ammo = 1;
						}
						sound_play(sndMutLastWish);
						canwalk = true;
						canaim = true;
						canspec = true;
					}
					if button_pressed(index,"spec"){
						canwalk = true;
						canaim = true;
						canspec = true;
					}
					if button_pressed(index,"swap"){
						other.mode = (other.mode + 1) mod 4;
					}
					//draw_sprite(weapon_get_sprite(other.weps[weppick]),(current_frame * 0.40) mod sprite_get_number(other.weps[weppick]),other.x,other.y-48);
					draw_text_nt(other.x,other.y-48-(index * 10),"[A]  @("+string(weapon_get_sprite(other.weps[weppick]))+")  [D]");
					draw_text_nt(other.x,other.y-32,weapon_get_name(other.weps[weppick]));
				}else{
					draw_text_nt(other.x,other.y-36,"CHOOSE WEAPON");
					draw_sprite(sprEPickup,0,other.x,other.y-12);
				}
				draw_text_nt(other.x,other.y+32,"[SPACE]#" + nl[? other.mode]);
			}
		}
		draw_set_halign(fa_left);
	}
#define nothingfloors
	with(Floor){
		if other.depth = 11{
			draw_sprite_ext(sprBackFloor,0,x,y,1,1,0,image_blend,1)
		}else{
			
			if !place_meeting(x,y+33,Floor) && point_distance(x+16,y+16,10016,10016) < 32 * 6{
				draw_sprite_ext(sprBackFloor2,0,x,y+48,1,1,0,merge_color(image_blend,c_black,0.6),1)
				
			}
			if !place_meeting(x,y+33,Floor) && place_meeting(x-1,y,Floor) && place_meeting(x+33,y,Floor){
				draw_sprite_ext(sprBackFloor2,0,x,y+32,1,1,0,merge_color(image_blend,c_black,0.3),1)
			}
			draw_sprite_ext(sprBackFloor2,0,x,y,1,1,0,image_blend,1)
		}
	}
#define draw_gui 
	with(instances_matching(CustomEnemy,"name","freakcont")){
		if(fade != 0){
			draw_set_color(c_black);
			draw_set_alpha(fade);
			draw_rectangle(0,0,game_width,game_height,0);
			draw_set_alpha(1);
			draw_set_color(c_white);
		}
		if text2 != ""{
			draw_text_nt(8 + (game_width * xoff2),game_height - 26,text2);
			timer2 -= current_time_scale;
			if timer2 <= 0{
				text2 = "";
			}
			if xoff2 > 0 xoff2 *= 0.66;
		}
		if(active){
			draw_text_nt(8 + (game_width * xoff),game_height - 16,"KILLS: " + string(GameCont.kills));
			if (timer_thunder > 0){
				timer_thunder -= current_time_scale;
				if timer_thunder <= 0{
					thunder_alpha = 1;
					
					sound_play_pitchvol(sndLightningCannonEnd,random_range(0.5,0.8),0.5)
					timer_thunder = 30 * irandom_range(2,6);
				}
			}
		}
		if (thunder_alpha > 0){
			thunder_alpha -= 0.025 * current_time_scale;
			background_color = merge_color(c_black,c_white,thunder_alpha);
			with(hitme){
				image_blend = merge_color(c_white,c_gray,other.thunder_alpha);
			}
			with(Floor){
				image_blend = merge_color(c_white,c_black,other.thunder_alpha);
			}
		}
	}
	
#define arena_create 
	deletestage();
	with(enemy) instance_delete(self);
	with(ThroneStatue) instance_delete(self);
	with(instances_matching(CustomDraw,"name","nothingfloors")) instance_delete(self);
	with(instance_create(10000,10000,CustomEnemy)){
		sprite_index = sprCampfire;
		mask_index = mskPlayer;
		donotdelete = true;
		team = 0;
		name = "freakcont";
		my_health = 9999;
		maxhealth = 9999;
		candie = false;
		size = 10;
		image_speed = 0.40;
		timer = 30 * 15;
		timer_purchaseslaves = 30 * 30;
		spawns = 0;
		loops = 0;
		active = false;
		fade = 0;
		xoff = 1;
		xoff2 = 1;
		text2 = "";
		quickload = 0;
		infhp = 0;
		timer_thunder = 30;
		thunder_alpha = 0;
		mode = mode_freak;
		slave = [-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4];
		for(var i = -6;i<=6;i++){
			for(var o = -3;o<=3;o++){
				with(instance_create(x + (i * 32),y + (o * 32),Floor)){
					if range(i,-2,2) && range(o,-2,2)
						sprite_index = sprFloor6;
				}
			}
		}
		for(var i = -3;i<=3;i++){
			for(var o = -4;o<=4;o++){
				with(instance_create(x + (i * 32),y + (o * 32),Floor)){
					if range(i,-3,3) && range(o,-3,3)
						sprite_index = sprFloor6;
				}
			}
		}
		weps = [];
		var d = 0;
		for(var i = 1;i<=126;i++){
			if weapon_get_area(i) <= 6{
				weps[d] = i;
				d++;
			}
		}
		with(script_bind_draw(nothingfloors,11)){
			persistent = true;
			name = "nothingfloors";
		}
		with(script_bind_draw(nothingfloors,12)){
			persistent = true;
			name = "nothingfloors";
		}
		background_color = c_black;
		on_step = script_ref_create(campfire_step);
		on_draw = script_ref_create(campfire_draw);
		on_hurt = script_ref_create(campfire_hit);
	}
	
#define step 
	if instance_exists(GenCont) || instance_exists(menubutton){
		global.gce = 1;
	}else{
		if global.gce = 1{
			arena_create();
			GameCont.area = 0;
			global.gce = 0;
		}
	}
	with(instances_matching(Player,"canwalk",false)){
		with(instances_matching(Player,"canwalk",true)){
			if distance_to_object(other) < 4 && my_health > 1{
				sound_play(other.snd_wrld);
				sound_play(sndMutLastWish);
				with(instance_create(other.x,other.y,PopoExplosion)){
					image_xscale = 0.5;
					image_yscale = 0.5;
					mask_index = mskNone;
				}
				with(other){
					canwalk = true;
					canspec = true;
					canaim = true;
					canspirit = true;
					mask_index = mskPlayer;
					other.my_health = max(round(other.my_health)/2,1)
					my_health = min(other.my_health,maxhealth);
					spr_idle = temparray[0];
					spr_walk = temparray[1];
					spr_hurt = temparray[2];
					wep = lastwep[0];
					bwep = lastwep[1];
					reload = weapon_get_load(wep);
					image_index = 0;
					image_speed = 0.40;
				}
			}
		}
	}