//{ boss intros, by saniblues, mutilated by blaac,.. sorry
#define boss_trigger
	// boss_trigger(str:"bossname",sprite1,sprite2,sprite3)
	// Hardcoded to only handle three right now. Will make modular on a later date.
	
	
	var only1 = 1;
	with instances_matching(CustomObject,"name","bossintro")
		only1 += 1;
	if only1 == 1
	// I could just use a fork() call instead, but this is easier
	with(instance_create(argument4.x,argument4.y,CustomObject)){
		name = "bossintro";
		bossname = argument0;
		
		if bossname = "" || (mod_variable_exists("mod","options","bossportraits") and mod_variable_get("mod","options","bossportraits") == "0")
			fadedark = 0
		else {
			fadedark = 1
			sound_play(sndBossIntroIn)
			}
		
		bossname = string_replace_all(bossname," ","#");
		spr[0] = argument1;
		spr[1] = argument2;
		spr[2] = argument3;
		on_step = script_ref_create(customboss_step);
		bossx = game_width;
		bosssplat = 0;
		letterind = 3;
		if TopCont.darkness = 1
			light = 1
		depth = -11;
		with Player
			view_object[index] = other
		with instances_matching_ne(projectile,"fakeEnemyBullet",1){
			spd = speed;
			_x=x
			_y=y
			if alarm0>0
			_alrm0 = alarm0
		}
		
		with(Player){
			_x = x
			_y = y
			_mask = mask_index;
			canwalk = false;
			canpick = false;
			canspec = false;
			canswap = false;
			canaim  = false;
			_reload = reload;
			_breload = breload;
			reload = 99999;
			breload = 99999;
			mask_index = mskNone
		}
		customheight = argument5
		
	}
	
#define customboss_step
		with RavenFly {
			if ("frozen" not in self || frozen = 0){
				alrm0 = alarm0;
				alrm1 = alarm1;
				alrm2 = alarm2;
				alrm3 = alarm3;
				alrm4 = alarm4;
				spd = speed;
				dir = direction;
				img_spd = image_speed;
				wlk = walk;
				_z = z
				
				alarm0 = -1;
				alarm1 = -1;
				alarm2 = -1;
				alarm3 = -1;
				alarm4 = -1;
				speed = 0;
				image_speed = 0;
				walk = 0;
				frozen = 1
			}
			z = _z
			}
		with(hitme) if ("frozen" not in self || frozen = 0){
			if object_index != CustomEnemy{
				alrm0 = alarm0;
				alrm1 = alarm1;
				alrm2 = alarm2;
				alrm3 = alarm3;
				alrm4 = alarm4;
				spd = speed;
				dir = direction;
				img_spd = image_speed;
				if "walk" in self{
					wlk = walk;
					walk = 0;
					}
				
				alarm0 = -1;
				alarm1 = -1;
				alarm2 = -1;
				alarm3 = -1;
				alarm4 = -1;
				speed = 0;
				image_speed = 0;
			}else{
				if "alrm0" in self{
					if "alrm0" in self{
						_alrm0 = alrm0;
						alrm0 = -1;
					}
					if "alrm1" in self{
						_alrm1 = alrm1;
						alrm1 = -1;
					}
					if "alrm2" in self{
						_alrm2 = alrm2;
						alrm2 = -1;
					}
					if "alrm3" in self{
						_alrm3 = alrm3;
						alrm3 = -1;
					}
					if "alrm4" in self{
						_alrm4 = alrm4;
						alrm4 = -1;
					}
				}
				if "walk" in self{
					_wlk = walk;
					walk = -1;
				}
				spd = speed;
				dir = direction;
				img_spd = image_speed;
				
				speed = 0;
				direction = 0;
				image_speed = 0;
				if "animating" in self
				image_speed = img_spd
			}
			frozen = 1
		}
	with enemy if "walk" not in self{ 
			speed = 0
			}
	with Player{
		x=_x
		y=_y
		}
	with instances_matching_ne(projectile,"fakeEnemyBullet",1){
		if "spd" not in self{
			spd = speed;
		}
		speed = spd;
		if "_x" not in self{
			_x = x
			_y = y
			}
		x=_x
		y=_y
		if "_alrm0" in self
		alarm0 = _alrm0 
		else if alarm0>0
		_alrm0 = alarm0
		//x += lengthdir_x(spd,direction + 180);
		//y += lengthdir_y(spd,direction + 180);
		}
	if bosssplat < 2{
		bosssplat += 0.4;
		}
	else 
		bosssplat = 2;
	
	if bossx > game_width*0.60{
		bossx -= game_width/24
		}
	else if bossx <= game_width*0.66 && bossx >= game_width * 0.33{
		bossx -= game_width/180
		}
	else{
		bossx -= game_width / 6;
		if letterind > 0
			letterind -= 1;
		if bossx < game_width{//*-1.25{
			with(hitme) if "frozen" in self{
				if object_index != CustomEnemy{
					alarm0 = alrm0;
					alarm1 = alrm1;
					alarm2 = alrm2;
					alarm3 = alrm3;
					alarm4 = alrm4;
					speed = spd;
					direction = dir;
					image_speed = img_spd;
					if "wlk" in self walk = wlk;
				}else{
					if "_alrm0" in self alrm0 = _alrm0;
					if "_alrm1" in self alrm1 = _alrm1;
					if "_alrm2" in self alrm2 = _alrm2;
					if "_alrm3" in self alrm3 = _alrm3;
					if "_alrm4" in self alrm4 = _alrm4;
					if "_wlk"   in self walk = _wlk;
					speed = spd;
					direction = dir;
					image_speed = img_spd;
				}
				frozen = 0
			}
			with RavenFly if "frozen" in self{
					alarm0 = alrm0;
					alarm1 = alrm1;
					alarm2 = alrm2;
					alarm3 = alrm3;
					alarm4 = alrm4;
					speed = spd;
					direction = dir;
					image_speed = img_spd;
					walk = wlk;
					z = _z
					frozen = 0
					}
			with(Player){
				canwalk = true;
				canpick = true;
				canspec = true;
				canswap = true;
				canaim  = true;
				mask_index = _mask;
				reload = _reload;
				breload = _breload;
				view_object[index] = self
				}
			if fadedark == 1
			sound_play(sndBossIntroOut)
			
			instance_destroy();
		}
	}
	if instance_exists(self) if (instance_exists(SpiralCont)|| !instance_exists(Player)){
		with instances_matching(GameObject,"frozen",1){
				if object_index != CustomEnemy{
					alarm0 = alrm0;
					alarm1 = alrm1;
					alarm2 = alrm2;
					alarm3 = alrm3;
					alarm4 = alrm4;
					speed = spd;
					direction = dir;
					image_speed = img_spd;
					if "wlk" in self walk = wlk;
				}else{
					if "_alrm0" in self alrm0 = _alrm0;
					if "_alrm1" in self alrm1 = _alrm1;
					if "_alrm2" in self alrm2 = _alrm2;
					if "_alrm3" in self alrm3 = _alrm3;
					if "_alrm4" in self alrm4 = _alrm4;
					if "_wlk"   in self walk = _wlk;
					speed = spd;
					direction = dir;
					image_speed = img_spd;
				}
				frozen = 0
			}
			with RavenFly if "frozen" in self{
					z = _z
					}
			with(Player){
				canwalk = true;
				canpick = true;
				canspec = true;
				reload = _reload;
				breload = _breload;
				view_object[index] = self
			}
			instance_destroy();
		}
#define draw_gui
	with(instances_matching(CustomObject,"name","bossintro")){
		if fadedark = 1{
			if bossx > game_width * 0.33{
				draw_set_alpha(0.7);
				draw_set_color(c_black);
				draw_rectangle(0,0,game_width,game_height,0);
			}
		}
		if bossname != ""{
			draw_set_alpha(1);
			draw_set_color(c_white);
			draw_sprite(sprLetterbox,letterind,0,0);
			draw_sprite_ext(sprLetterbox,letterind,game_width,game_height,-1,-1,0,c_white,1);
			draw_sprite(spr[0],0,bossx*1.10,0);
			draw_sprite(spr[1],0,bossx,0);
			draw_sprite(spr[2],0,bossx*0.90,0);
			if bossx > game_width * 0.33{
				draw_sprite(sprBossNameSplat,bosssplat,(game_width*0.50),(game_height*0.5)+customheight);
				}
			draw_set_font(fntBigName);
			draw_set_halign(1);
			draw_text_nt((((game_width*0.80)-(bossx/3)-64)),(game_height*0.4)+customheight," "+bossname);
			
			draw_set_halign(0);
		}
	}
#define boss_death
	if instance_exists(Player) and !instance_exists(SpiralCont)
		boss_trigger("",mskNone,mskNone,mskNone,self,0)	
//}