#define init
	with instances_matching(CustomDraw,"name","bosshealthbar"){
		instance_destroy();
	}
	with(script_bind_draw(bosshealth_draw,-10)){
		persistent = 1;
		name = "bosshealthbar";
		boss = [];// For multiple healthbars
		boss_num = 0;
		boss_name = "";
		boss_hp_current = 0;
		boss_hp_last = 0;
		boss_hp_max = 0;
		boss_yoffset = 0;
		col = c_red;
		showhpbar = 0;
	}
	
#define draw_gui
	var xstart = 0;
	var ystart = 0;
	var ysize = 240 + 31;
	var baroffset = 14
	var barsize = 8;
	var xsize = 320;
	var len = 304
	with instances_matching(CustomDraw,"name","bosshealthbar"){
	with(ProtoStatue){
		if other.boss_name = "Proto Statue"{
			if distance_to_object(Player) > game_width/2{
				other.showhpbar = 0;
			}else other.showhpbar = 1
		}
	}
	if (showhpbar){
		if boss_yoffset < 32 boss_yoffset += 4;
	}else{
		boss_yoffset -= 8;
		if boss_yoffset <= 0{
			boss_yoffset = 0;
			if (boss_name != "Proto Statue" || (boss_name = "Proto Statue" && !instance_exists(ProtoStatue))) bosshp_reset();
		}
	}
	
	if array_length_1d(instances_matching(hitme,"boss",1)) = 0 && !instance_exists(LilHunterFly){
		if showhpbar > 0 showhpbar--;
	}
	boss_hp_current = 0;
	for(var i = 0;i<array_length_1d(boss);i++){
		if !instance_exists(boss[i]){
				boss[i] = -1;
		}
	}
	with instances_matching(hitme,"boss",1){
		other.boss_hp_current += my_health;
		if "ind" not in self{
			other.boss[other.boss_num] = id;
			other.boss_num++;
			ind = 1;
		}
	}
	if boss_hp_last > boss_hp_current{
		boss_hp_last -= max((boss_hp_last - boss_hp_current)/8,0.5)
	}else boss_hp_last = boss_hp_current;
	if instance_exists(LastDie){
		boss_hp_current = 1;
		boss_hp_last = boss_hp_max;
	}
	if (boss_yoffset){
		// Healthbar
		for(var i = 0;i<array_length_1d(boss);i++){
			if boss[i] != -1{
				with(boss[i]){
					if object_index = LilHunter{
						if(fork()){
							while instance_exists(self){
								if object_index = LilHunter{
									var _h = my_health;
									var _m = maxhealth;
									wait 1;
									if instance_exists(self){
										if object_index != LilHunter{
											my_health = _h;
											maxhealth = _m;
											exit;
										}
									}
								}
							}
							exit;
						}
					}
					if "my_health" in self{
						draw_healthbar_sani(xstart + 8 + (len * i)/array_length_1d(other.boss), ystart + ysize - baroffset - other.boss_yoffset, len / array_length_1d(other.boss), 8, my_health,maxhealth,0,col);
						if object_index = ProtoStatue{
							draw_healthbar_sani(xstart + 8 + (len * i)/array_length_1d(other.boss), ystart + ysize - baroffset - other.boss_yoffset + 9, len / array_length_1d(other.boss), 4, rad,25,0,col);
						}
						// Numerical health value. Only drawn when fewer than four bosses
						// Gets too cluttered beyond that
						if other.boss_num < 4{
							draw_set_halign(fa_center);
							draw_set_valign(fa_top);
							draw_text_nt(
								xstart + 8 + (len * i)/array_length_1d(other.boss) + (len / array_length_1d(other.boss) / 2),
								ystart+ysize-baroffset+1-other.boss_yoffset,
								string(max(0,ceil(my_health))) + "/" + string(ceil(maxhealth)));
						}
					}
				}
			}else{
				draw_healthbar_sani(xstart + 8 + (len * i)/array_length_1d(boss), ystart + ysize - baroffset - boss_yoffset, len / array_length_1d(boss), 8, 0,0,0,c_black);
				if boss_num < 5{
					draw_set_halign(fa_center);
					draw_set_valign(fa_top);
					draw_set_alpha(sin((current_frame + (i * 20))/8));
					draw_text_nt(
						xstart + 8 + (len * i)/array_length_1d(boss) + (len / array_length_1d(boss) / 2),
						ystart+ysize-baroffset+1-boss_yoffset,
						"FAINTED");
					draw_set_alpha(1);
				}
			}
		}
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		draw_text_nt(xstart+8,ystart+ysize-baroffset-boss_yoffset,string(boss_name));
	}	
	}
#define bosshealth_draw 

#define bosshp_reset
	with(instances_matching(CustomDraw,"name","bosshealthbar")){
		boss_name = "";
		boss_hp_current = 0;
		boss_hp_last = 0;
		boss_hp_max = 0;
		boss_col = c_red;
		boss_num = 0;
		boss = [];
		showhpbar = false;
	}
#define bosshp_init
	with(instances_matching(CustomDraw,"name","bosshealthbar")){
		if boss_name = "" || array_length_1d(instances_matching(hitme,"boss",1)) > boss_count || boss_hp_current = 0{
			boss_count = 0;
			boss_hp_max = 0;
			with(instances_matching(hitme,"boss",1)){
				other.boss_hp_max += maxhealth;
				other.boss_name = bossname;
				other.col = col;
				other.boss_count ++;
			}
			if array_length_1d(instances_matching(hitme,"boss",1)) > 1{
				var _n = "";
				for(var i = 0;i<array_length_1d(boss);i++){
					if instance_exists(boss[i]) && boss[i] != -1{
						if _n = "" _n = boss[i].bossname;
						if boss[i].bossname != _n{
							boss_name = "BOSSES";
						}else{
							boss_name = string(_n) + "s";
						}
					}
				}
			}
			showhpbar = 90;
		}
	}
#define draw_healthbar_sani
	// draw_healthbar_sani(left,top,length,height,minamount,maxamount,oldamount,hpcolor)
	var hpratio;
	var hpdrain;
	var xstart = argument0;
	var ystart = argument1;
	var length = argument2;
	var height = argument3;
	
	if argument4 > 0{
		hpratio = ((argument4 * 100)/argument5)/100
		if argument6 != -1 hpdrain = ((argument6 * 100)/argument5)/100
			else hpdrain = 0;
	}else{
		hpratio = 0;
		hpdrain = 0;
	}
	
	draw_set_color(c_black);
	draw_rectangle(xstart,ystart,xstart+length,ystart+height+2,0);
	draw_set_color(c_white);
	draw_rectangle(xstart+1,ystart+1,xstart+length-1,ystart+height,0);
	draw_set_color(c_black);
	draw_rectangle(xstart+2,ystart+2,xstart+(length)-2,ystart+height-1,0);
	draw_set_color(merge_color(argument7,c_black,0.4))
	draw_rectangle(xstart+2,ystart+2,xstart + 2 + ((length - 4) * hpdrain),ystart+height-1,0);
	draw_set_color(argument7)
	if (argument4 > 0) draw_rectangle(xstart+2,ystart+2,xstart + 2 + ((length - 4) * hpratio),ystart+height-1,0);
	draw_set_color(c_black);
	draw_set_alpha(0.4);
	if argument3 > 4 draw_line(xstart+1,ystart+2,xstart + 2 + ((length - 4)),ystart+2);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
#define step
	/// Establish what is and is not a boss
	/// Note: Different loops are executed to assign colors
	if GameCont.area = 0{
		with(enemy){
			if instance_exists(BecomeNothing2){
				boss = 1;
				if team = 3{
					col = c_blue
					bossname = "IDPD Encounter";
				}else{
					col = c_red;
					bossname = "Freak Encounter";
				}
			}
		}
		if instance_exists(BecomeNothing2){
			if BecomeNothing2.image_speed != 1 && CustomDraw.showhpbar > 1{
				CustomDraw.showhpbar = 1;
			}
		}
	}
	with(instances_matching(hitme,"object_index",BanditBoss,ScrapBoss,FrogQueen,HyperCrystal,TechnoMancer)){
		if "boss" not in self && intro = 1{
			col = c_red;
			if (object_index = HyperCrystal)
				col = c_purple;
			switch(object_index){
				case BanditBoss: bossname = "Big Bandit"; break;
				case ScrapBoss: bossname = "Big Dog"; break;
				case FrogQueen: bossname = "Ballmum"; break;
				case HyperCrystal: bossname = "@qH@qY@qP@qE@qR @qC@qR@qY@qS@qT@qA@qL"; break;
				case TechnoMancer: bossname = "Techno Mancer"; break;
			}
			boss = 1;
		}
	}
	with(LilHunter){
		var _h = my_health;
		var _m = maxhealth;
		if object_index != LilHunter{
			my_health = _h;
			maxhealth = _m;
		}
	}
	with(instances_matching(hitme,"object_index",LilHunter,LilHunterFly,Last,LastExecute)){
		if "intro" not in self intro = 1;
		if object_index = LastExecute{
			with(instances_matching(CustomDraw,"name","bosshealthbar")){
				other.maxhealth = boss_hp_max;
				boss_num = 0;
				boss[0] = other.id;
				boss_hp_last = boss_hp_max * (other.alarm0 / 380);
			}
		}
		if "boss" not in self && intro = 1{
			col = c_blue;
			if object_index = LilHunter || object_index = LilHunterFly bossname = "Lil' Hunter"
				else bossname = "The Captain";
			boss = 1;
		}
	}
	with(instances_matching(hitme,"object_index",ProtoStatue,CrownGuardian,CrownGuardianOld,Nothing,Nothing2)){
		if "intro" not in self intro = 1;
		if "boss" not in self && intro = 1{
			col = c_lime;
			switch(object_index){
				case ProtoStatue: bossname = "Proto Statue"; break;
				case CrownGuardian: bossname = "Crown Guardian"; break;
				case CrownGuardianOld: bossname = "Ancient Guardian"; break;
				case Nothing: bossname = "Nuclear Throne"; break;
				case Nothing2: bossname = "Punished Throne"; break;
			}
			boss = 1;
		}
	}
	
	if array_length_1d(instances_matching(hitme,"boss",1)) > 0{
		bosshp_init();
	}