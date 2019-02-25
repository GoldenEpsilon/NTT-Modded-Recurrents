#define init
	/*
*  Original mod by Yokin
*  Inspiration to rewrite, and some ideas used, from YAL's edit of original
*  Previous version by Yokin
*  YAL added instances_matching, instances_matching_gt and other commands that improve performance
*  Enter Blaac, implements the commands and rewrites some bits to lower the amount of checks the mod makes, adds a few new effects
*  Current version by Blaac
	*/
global.bloodsurface = noone;
global.blooddraw = noone;

global.sprGore = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAFQAAAAMCAYAAAD8tppbAAAABmJLR0QA/AA4AABe/7ILAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QILAAkgVqEtZwAAAZBJREFUSMftlr9qwlAUxn/pQ0ghi1MFp0KXli59ALv4COnWxb1ChkDcu3Tz+gZOeQAXEQTBqRAnF6H4DIXTIbnpVbzJxVpKJR9ccu/Nd07O+XLuH6hRo4YdkrezwcUJkpMjbAWQ5TQxx6cS3uTKL/1ca86moOQJHiLaHEgHiP3ihRh9azCas5iMMUQtC77wX8UVYBgHAKKfLuKICJ+3bt9Iw5BUKVKlrHzJA5DlNJFet20KKMM4kGEc2AQVMZpOyhLVQX6F+CJZNTvxNTf2s2cVPw1DSZUSDSdBlSrsUqV2bIoKHcYBNw9dzHGv22Y5TXbm93Hnf/cHlr4LvwwDP6tmVy7Ay8bNphVFsF6zGo3wPA/Aq6rO1XwOzWY2s17bl/xiMub6vsPr+J2nvtqZN8cmZhv3PWo5Tbh8DnjME+9ntmUJMNtk7eNNaWIZ3+vnQg58dMylfACaTVpBUBkLwGq75arRKMRsRRFpGHqum6w+PMqWgjgeTPu+fnwAnPD2cIxv0RX7l9ebs7sm1ajxv/AFAoMIEWXE2HIAAAAASUVORK5CYII=", 7, 6, 6);
global.sprBlood = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAQCAYAAADpunr5AAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QYEDzc7O74OXQAAATRJREFUWMPtWMsNgzAMJd0HBoAp0kFhinSAdCD3UkuWZcA2IT3UT6pU0drx5/kThiEQaAEAgIjCn2Odx2GdR/F5NyWSvMmAmwJzd3Wh3/CFq0KpEjR6LyF78mgAl7ME4ciRHvJA4DnTIvuQHm7LlFBpLhVyqeBhUS4VaDI9bKUJ1TIxlwpeeS97n6/3oS/qGPBS4t+t8h4m0Y9Vh3S2RR4OYJGXkqduQ/xgK/tbJMAbgF8nwNq2H60GGZ0ZUks7awH0d9pCeiOllFrowfbr3ho87Octiw9kbQuT2Gfdwq6y2DuMpVZ0ZHvSOpVLhTN28IOQydsyJWlIaQeplZ2Sw6hPowMDR/8LAHClOtzy3lXS0w/37hBaFtIVmtttreQrN+sm9x7t2tbjJunZoOLVSCAQCJziA7wCXQYLP/tdAAAAAElFTkSuQmCC", 6, 8, 8);
global.sprBlankStreak = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAOAAAAAQCAYAAAAPv3P4AAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QYEBBccB2VwdQAAAXNJREFUaN7tWlsOwyAMI9MuQe9/tlyD/XQSQgUCDSTd7L89HQ07MbAQgL9BOoEabPlzEGS5d8GJiDyIzroOK35vwI9g0G0txOfFgAAMaB5zMH2ApgGZuZuRY4xzhILFz/mP4yDNLN/jZ+bU4nzSBEwpJUuzw+hCA0oMd9d4miIsO/kKI46KqzVdavXN1FATtkTw+Xs0p+Eo926Tem4GL6n5Yoxq5rsSJTOnvJbyseYU7H2uxytdzN6J39Vrs9y15/MaVomw9b0t7tWmeELkfu2cehLBS0xHJ7S4S86ZCFrWJG0MGtyzptkhTEvxPyECv70WVgqxFjuJiHbc65QxRivWSAx3hxv7MOd7wJEIurJDfeuQTgDrfeDIPsuK/6mxDIcwDg5hRk4jvZhvtL7dJsBdoFMDjh4E3DHizKLXzOjJeLV/u+y4hriaauUkvorqWnW0pu7oiTEMCPzU1PMYQb3U4KEBwIAbjYiODwAAAAAAEEIIHwDlcous2aDTAAAAAElFTkSuQmCC", 7, 8, 8);
global.sprBlankDamage = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEAAAAAQCAYAAACm53kpAAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4QYEBBssjQkP1QAAAH9JREFUWMPtldsKwDAIQ2v//5+zp4HILnZTSMU8tWBLYg92jFYNAQCFiSsjHnN3Z7M1o7qra2y9iAgrOfIWxms+IzQA6HvsPoWArwhrY+f6iQrX65iwGSTJSlhmlFNnQNQwZJzmk+2VqSiD0vZ/9F+EtwsRPQNW0KzarFarVU8HE3RzzZrLcmkAAAAASUVORK5CYII=", 4, 8, 8);

global.noblood = ds_map_create();
add_noblood(Spider);
add_noblood(LaserCrystal);
add_noblood(InvSpider);
add_noblood(InvCrystal);
add_noblood(LightningCrystal);
add_noblood(HyperCrystal);
add_noblood(Turret);
add_noblood(TechnoMancer);
add_noblood(Van);
add_noblood(Nothing);
add_noblood(Nothing2);
add_noblood(ScrapBossMissile);

global.radboys = ds_map_create();
add_radboys(RadMaggot);
add_radboys(Crab);
add_radboys(GoldScorpion);
add_radboys(LilHunter);
add_radboys(Guardian);
add_radboys(ExploGuardian);
add_radboys(DogGuardian);
add_radboys(EnemyHorror);
add_radboys(CrownGuardian);
add_radboys(CrownGuardianOld);

global.oilboys = ds_map_create();
add_oilboys(Sniper);
add_oilboys(Wolf);
add_oilboys(SnowBot);
add_oilboys(SnowTank);
add_oilboys(GoldSnowTank);
add_oilboys(SnowBotCar);



#define add_noblood(type)
global.noblood[?type] = true;

#define add_radboys(type)
global.radboys[?type] = true;

#define add_oilboys(type)
global.oilboys[?type] = true;

#define step
	 // Colors:
	global.bloodcolor = make_color_rgb(153 + random(20), 51 + random(6), 40 + random(4));
	global.acidcolor = make_color_rgb(133, 194 + random(55), 5 + random(21));
	global.radcolor = make_color_rgb(72 + random(118), 253, 8);
	global.oilcolor = make_color_hsv(0, 0, random_range(10, 25));

	 // Blood Drawing Place:
	if(!instance_exists(global.blooddraw)&&instance_exists(GenCont)
	&& GameCont.area!=101&& "noblood" not in TopCont){
		global.blooddraw = 
		script_bind_draw(blood_draw, 7);
	}
	 // Projectile Hitting Causes Blood Streak Stuff:
	with instances_matching_ne(projectile,"object_index",ToxicGas,Lightning,Flame,TrapFire) if(instance_exists(creator) && damage > 0 && (speed > 0 && (instance_is(self, Bolt) || instance_is(self, UltraGrenade)) || !instance_is(self, Bolt) && !instance_is(self, UltraGrenade))){
		if("gunangle" in creator) with(creator){
			if("wepangle" in self){
				var slashdir = gunangle + wepangle - (wepangle / 4);
			}
			else var slashdir = gunangle;
		}
		else var slashdir = direction;
		var bloodspd = force/2;
		if("gunangle" in creator && slashdir = creator.gunangle) var blooddir = image_angle + random_range(-5, 5);
		else var blooddir = slashdir + random_range(-damage * 1.5, damage * 1.5);
		var bloodsizey = clamp(damage / (5 * speed), 0.8, 2);

		with(hitme){
			if(team != other.team && !instance_is(self, prop) && global.noblood[?object_index] = null){
				if(
				("gunangle" not in other.creator || slashdir = other.creator.gunangle) && place_meeting(x - other.hspeed + hspeed, y - other.vspeed + vspeed, other) ||
				("gunangle" not in other.creator || slashdir != other.creator.gunangle) && nexthurt = current_frame + 5
				){
					blood_hit(blooddir, bloodspd, bloodsizey);
				}
			}
		}
	}

	 // Special Player Blood Effects:
	with(Player){
		switch(race){
			case "robot":
				 // Eating Blood Weapons:
				if(button_pressed(index, "spec") && string_upper(string_copy(weapon_get_name(wep), 0, 5)) = "BLOOD" && bwep != 0 && canspec){
					with instance_create(x,y,BloodStreak){
						motion_add(random(360), 1 + random(4));
						image_angle = direction;
						creator = other;
					}
				}
				break;
			case "rebel":
				 // Spawning Allies:
				if(button_pressed(index, "spec") && my_health > clamp(instance_number(Ally), 1, 2)){
					with instance_create(x,y,BloodStreak){
						motion_add(random(360), 1 + random(4));
						image_angle = direction;
						creator = other;
					}
				}
				break;
		}
	}
		// Contact Damage Bloods:
	with instances_matching_gt(enemy,"meleedamage",0)
		if("canmelee" in self && canmelee || "canmelee" not in self){
			with(Player) if(place_meeting(x - other.hspeed + hspeed, y - other.vspeed + vspeed, other) && team != other.team && nexthurt <= current_frame){
				if(skill_get(8) && other.my_health <= clamp(6 + (1000 * speed), 6, 12) || !skill_get(8)){ 
					blood_hit(other.direction, other.meleedamage + random(4), other.meleedamage / 2);
				}
			}
		}
		// Gamma Guts Bloods:
	if(skill_get(8)) with(Player) 
			with(enemy) if(place_meeting(x,y,other) && (global.noblood[?object_index] = null && global.oilboys[?object_index] = null && global.radboys[?object_index] = null)){
			blood_hit(point_direction(other.x, other.y, x, y) + random_range(-20, 20), clamp((my_health / 5) + random(4), 0, 8), clamp(my_health / 5, 0, 2));
			}
	with(GammaBlast) with instances_matching(enemy,"team",team) if(place_meeting(x,y,other) && (global.noblood[?object_index] = null && global.oilboys[?object_index] = null && global.radboys[?object_index] = null)){
			blood_hit(point_direction(other.x, other.y, x, y) + random_range(-20, 20), clamp((my_health / 3) + random(4), 0, 8), clamp(my_health / 3, 0, 2));
			}

		// Explosion Gore:
	with Explosion
		with enemy if (place_meeting(x,y,other) && my_health <= 0 && global.noblood[?object_index] = null && global.oilboys[?object_index] = null && global.radboys[?object_index] = null){
		repeat(2 * size) with instance_create(x,y,Shell){
			name = "gore";
			motion_set(random(360), random(other.speed) + 2);
			creator = other;
		}
	}

		 // Find Child Corpse:
	with instances_matching_ne(enemy,"findingcorpse",1)
		if fork(){
			findingcorpse = 1;
			while instance_exists(self){
				var _x = x;
				var _y = y;
				var _obj = object_index;
				if("race" in self) var _race = race;
				else var _race = undefined;
				wait 1;
			}
			with instance_nearest(_x, _y, Corpse){
				creatorobj = _obj;
				creatorrace = _race;
			}
			exit;
		}

		// Blood Explosions Make Blood Streaks:
	with(MeatExplosion) if(image_index = image_speed){
		for(var i = 0; i <= 360; i += 120){
			with instance_create(x,y,BloodStreak){
				motion_add(random(360) + i, random(4) + 1);
				image_angle = direction;
				image_xscale = random_range(0.8,2)
			}
		}
	}

	
	
		// Corpse Gore:
	with instances_matching_gt(Corpse,"creatorobj",-1){
		if(size > 0 && !object_is_ancestor(creatorobj, prop) && global.noblood[?creatorobj] = null && global.oilboys[?creatorobj] = null && global.radboys[?creatorobj] = null){
			if("goreready" not in self){
				goreready = 1;
				if(fork()){
					while(instance_exists(self)){
						var _x = x;
						var _y = y;
						var _size = size;
						wait 1;
					}
					repeat(random(_size * 2)) with instance_create(_x, _y, Shell){
						name = "gore";
						motion_set(random(360), random(3) + 2);
						creator = other;
					}
					if instance_exists(self)
						creatorobj = -1
					exit;
				}
			}
		}
		// Guardians Make Acidic Explosions to Hide the BloodPooling out of no where ,not radmaggots
		if !(global.radboys[?creatorobj] = null)&&creatorobj!=252{
			if instance_exists(self)
				for(var i = 0; i <= 360; i += 120){
				with instance_create(x,y,AcidStreak){
					motion_add(random(360) + i, random(4) + 1);
					image_angle = direction;
					image_xscale = random_range(0.8,2)
					}
				wait 1
				}
			creatorobj = -1
			}
	}
		//Bloody Player Corpses at Loop Campfire
	if GameCont.area = 0 and GameCont.hard > 0 and instance_exists(Wall)
	with Corpse if "creatorobj" not in self && "creatorobj" not in self{
		if sprite_index = sprMutant8Dead
			creatorrace = "robot"
		else 
			creatorrace = undefined
		creatorobj = 0
		motion_add(random(360),random(10))
		}
	
		// Guardian and Throne Bullets Spit at Spawn
	with instances_matching_ne(GuardianBullet,"messy",1)if place_meeting(x+hspeed,y+vspeed,Floor){
			with instance_create(x,y,AcidStreak){
				motion_add(other.direction, random(4) + 1);
				image_angle = direction;
				image_xscale = random_range(0.8,2)
				}
			messy = 1
			}
		// Scorpion, ExploGuardian, and Throne Bullets Spit at Spawn
	/*with instances_matching_ne(EnemyBullet2,"object_index",Exploder,SuperFrog) if "messy" not in self && place_meeting(x+hspeed,y+vspeed,Floor){
			with instance_create(x,y,AcidStreak){
				motion_add(other.direction, random(4) + 1);
				image_angle = direction;
				image_xscale = random_range(0.8,2)
				}
			messy = 1
			}*/
		// Horror is an Extra Messy Dog
	with instances_matching(HorrorBullet,"sprite_index",sprHorrorBullet)if place_meeting(x+hspeed,y+vspeed,Floor) && random(4)<1{
			with instance_create(x,y,AcidStreak){
				motion_add(other.direction, random(4) + 1);
				image_angle = direction;
				image_xscale = random_range(0.8,2)
				}
			}
		// Bskin Lightning Because ...shrug
	with instances_matching(HorrorBullet,"sprite_index",sprHorrorBBullet) if random(10)<1{
			with instance_create(x,y,PortalL){
				motion_add(other.direction, random(4) + 1);
				image_angle = direction;
				image_xscale = random_range(0.8,2)
				}
			}
		// LilHunter Mess:
	with LilHunterDie if random(4)<1{
		with instance_create(x,y,AcidStreak){
			motion_add(other.direction+180+random_range(-45,45), random(4) + 1);
			image_angle = direction;
			image_xscale = random_range(0.8,2)
			}
		}
		// Gore Stuff:
	with instances_matching(Shell, "name", "gore"){
		if(sprite_index != global.sprGore){
			sprite_index = global.sprGore;
			image_index = irandom(image_number - 1);
			image_angle = random(360);
			image_xscale = 0.8 + random(0.2);
			image_yscale = image_xscale;
			image_speed = 0;
			friction = 0.20;
			rotdir = choose(-2, 2);
		}

		image_angle += speed * rotdir;
		if(alarm0 = 1) instance_create(x,y,Dust);
		if(instance_exists(GenCont)) instance_destroy();
		else with(Slash) if(place_meeting(x,y,other)){
			repeat(1 + random(2)) with instance_create(other.x, other.y, AllyDamage){
				motion_add(other.direction + random_range(-30, 30), (other.speed/2) + random(2));
			}
			with(other) instance_destroy();
		}
	}

#define blood_hit(_direction, _speed, _yscale)
	with instance_create(x + random_range(-3,3), y + random_range(-3,3), BloodStreak){
		sprite_index = global.sprBlankStreak;
		motion_set(_direction, random(_speed/2) + random(2));
		image_angle = direction;
		image_yscale = _yscale;
		image_speed = 0.35 + random(0.5);
		depth = other.depth + 1;
		image_blend = global.bloodcolor;
		if(global.oilboys[?other.object_index] != null || "race" in other && other.race = "robot") image_blend = global.oilcolor;
		if(global.radboys[?other.object_index] != null || "race" in other && other.race = "horror") image_blend = global.radcolor;
		creator = other;
		creatorobj = other.object_index;
		if("race" in other) creatorrace = other.race;
		else creatorrace = undefined;
	}
	repeat(3) with instance_create(x + random_range(-3,3), y + random_range(-3,3), AllyDamage){
		sprite_index = global.sprBlankDamage;
		motion_set(_direction, random(_speed));
		image_angle = random(360);
		image_speed = 0.5 + random_range(-0.2, 0.2);
		image_blend = global.bloodcolor;
		if(global.oilboys[?other.object_index] != null || "race" in other && other.race = "robot") image_blend = global.oilcolor;
		if(global.radboys[?other.object_index] != null || "race" in other && other.race = "horror") image_blend = global.radcolor;
		creator = other;
	}

#define blood_draw
	
	if(!surface_exists(global.bloodsurface)){
		global.bloodsurface = surface_create(5000, 5000);
	}
	surface_set_target(global.bloodsurface);

	
	
	var surfx = 7500;
	var surfy = 7500;

	var bloodcolor = global.bloodcolor;
	var acidcolor = global.acidcolor;
	var radcolor = global.radcolor;
	var oilcolor = global.oilcolor;
	
	// Corpse Bloods:
	with instances_matching_gt(Corpse,"creatorobj",-1) if (!object_is_ancestor(creatorobj, prop) && global.noblood[?creatorobj] = null){
		var _color = bloodcolor;
		if(global.oilboys[?creatorobj] != null || creatorrace = "robot") _color = oilcolor;
		if(global.radboys[?creatorobj] != null || creatorrace = "horror") _color = radcolor;

		 // Blood Trailing:
		if(speed > 0 && image_index > 1){
			draw_blood_ext((x - surfx) + random_range(-4, 4), (y - surfy) + random_range(-4, 4), clamp(speed * choose(-1/(3 - skill_get(20)), 1/(3 - skill_get(20))), -3, 3), (size / 3) + 0.7, direction + random_range(-5, 5), _color);
		}

		 // Blood Pooling:
		if("bloodpool" not in self) bloodpool = 0;
		else if(speed <= 0 && image_speed = 0) 
			if bloodpool < ((size * 13) + 2){
				bloodpool += 2;
				draw_blood_ext((x - surfx) + lengthdir_x(random(size * 8), random(360)), (y - surfy) + lengthdir_y(random(size * 8), random(360)) + 4, (size / 3.33) + 0.7, (size / 3.33) + 0.7, random(360), _color);
			}else creatorobj = -1
	}

	 // Gore Bit Bloods:
	with instances_matching(Shell, "name", "gore") if(random(3) < 1){
		if(speed > 0) draw_blood_ext((x - surfx), (y - surfy), speed * choose(-1/3, 1/3), image_yscale, direction + random_range(-10, 10), bloodcolor);
	}

	 // Blood Streak Bloods:
	with(BloodStreak){
		if "adjust" not in self{
			adjust = 1
			direction += random_range(-45,45)
			}
		var _color = bloodcolor;
		if("creatorobj" in self){
			if(global.oilboys[?creatorobj] != null || creatorrace = "robot") _color = oilcolor;
			if(global.radboys[?creatorobj] != null || creatorrace = "horror") _color = radcolor;
		}
		draw_blood_ext((x - surfx) + lengthdir_x(8 + random(2), direction), (y - surfy) + lengthdir_y(8 + random(2), direction), (1 + speed) * choose(-0.75, 0.75), image_yscale*random_range(0.1,1.6), direction + random_range(-10, 10), _color);
	}

	 // Blood Gamble Bloods:
	with(BloodGamble){
		draw_blood((x - surfx) + lengthdir_x(16, image_angle) + lengthdir_x(random_range(-4, 4), image_angle + 90), (y - surfy) + lengthdir_y(16, image_angle) + lengthdir_y(random_range(-4, 4), image_angle + 90), bloodcolor);
	}

	 // Blood Weapon Drip Bloods:
	with(Player){
		if(string_upper(string_copy(weapon_get_name(wep), 0, 5)) = "BLOOD" && random(1500 / weapon_get_load(wep)) < 1){
			draw_blood((x - surfx) + lengthdir_x(random(3), random(360)), (y - surfy) + lengthdir_y(random(3), random(360)), bloodcolor);
		}
	}

	 // Blood Weapon Pickups Make Pools of Blood:
	with(WepPickup) if(string_upper(string_copy(weapon_get_name(wep), 0, 5)) = "BLOOD"){
		if("bloodpool" not in self || speed > 0) bloodpool = weapon_get_load(wep);
		if(speed <= 0 && bloodpool > 0){
			bloodpool -= 1;
			draw_blood_ext((x - surfx) + lengthdir_x(random(6), random(360)) + lengthdir_x((sprite_width/2) - sprite_xoffset, rotation), (y - surfy) + lengthdir_y(random(6), random(360)) + lengthdir_y((sprite_width/2) - sprite_xoffset, rotation), 0.7 + random(0.2), 0.7 + random(0.2), random(360), bloodcolor);
		}
	}

	 // Crown of Blood Drip Bloods:
	if(GameCont.crown == 7) with(Crown){
		if(random(66) < 1 || speed <= 0 && random(20) < 1){
			draw_blood((x - surfx) + lengthdir_x(random(3), random(360)), (y - surfy) + lengthdir_y(random(3), random(360)) + 6, bloodcolor);
		}
	}
	
	 // Acid Mess:
	with(AcidStreak) if(random(3) < 1){
		draw_blood_ext((x - surfx) + lengthdir_x(8 + random(2), direction), (y - surfy) + lengthdir_y(8 + random(2), direction), (1 + speed) * choose(-0.6, 0.6), image_yscale, direction + random_range(-10, 10), acidcolor);
	}

	// Throne Beam Mess:
	with(NothingBeamParticle) if(random(30) < 1){
		draw_blood_ext((x - surfx) + lengthdir_x(8 + random(2), direction), (y - surfy) + lengthdir_y(8 + random(2), direction), (1 + speed) * choose(-0.6, 0.6), image_yscale, direction + random_range(-10, 10), acidcolor);
	}
	
	 // Toxic Gas Mess:
	with instances_matching_lt(ToxicGas,"image_xscale",0.2){
		draw_blood_ext((x - surfx), (y - surfy), 0.3 + random(0.2), 0.3 + random(0.2), random(360), acidcolor);
	}

	 // Horror Beam Mess:
	with instances_matching(HorrorBullet,"sprite_index",sprHorrorBullet)if place_meeting(x+hspeed,y+vspeed,Floor) &&(random(10) < 1){
		draw_blood_ext((x - surfx), (y - surfy), speed * choose(-0.15, 0.15), image_yscale * choose(-1, 1), direction + random_range(-10, 10), radcolor);
	}
	// Slight Rad Mess:
	with instances_matching_gt(Rad,"speed",0.4)if place_meeting(x+hspeed,y+vspeed,Floor) &&(random(10) < 1){
		draw_blood_ext((x - surfx), (y - surfy), 0.3 + random(0.2), 0.3 + random(0.2), random(360), acidcolor);
	}
	// LilHunter Mess:
	with LilHunterDie{
		draw_blood_ext((x - surfx) + random_range(-4, 4), (y - surfy) + random_range(-4, 4), clamp(speed * choose(-1/(3 - skill_get(20)), 1/(3 - skill_get(20))), -3, 3), 1, direction + random_range(-5, 5), radcolor);
		}
	
	with instances_matching_ne(GenCont,"cleanup_",1){
	draw_clear_alpha(0, 0);	
	//trace("clean")
	cleanup_ = 1
	}
	// Draw Surface:
	surface_reset_target();
	draw_surface(global.bloodsurface, surfx, surfy);
	
#define draw_blood(_x, _y, _color)
	return draw_sprite_ext(global.sprBlood, irandom(sprite_get_number(global.sprBlood) - 1), _x, _y, 1, 1, random(360), _color, 0.9);
	instance_destroy()//idontknow if this is helping but its not hurting
#define draw_blood_ext(_x, _y, _xscale, _yscale, _angle, _color)
	return draw_sprite_ext(global.sprBlood, irandom(sprite_get_number(global.sprBlood) - 1), _x, _y, _xscale, _yscale, _angle, _color, 0.9);
	instance_destroy()