#define init
	global.shrinespawned = 0
    global.spr = {};
    with(global.spr){
     // Sprites:
         // Floors:
        AreaFloor =         sprFloor100;
        AreaFloorB =        sprFloor100;
        AreaFloorExplo =    sprFloor100Explo;
         // Walls:
        AreaWallBot =       sprWall100Bot;
        AreaWallTop =       sprWall100Top;
        AreaWallOut =       sprWall100Out;
        AreaWallTrans =     sprWall100Trans;
         // Misc:
        AreaDebris =        sprDebris100;
    }
	
    
    if DEBUG{
        trace("Press 4 to test area");
        if fork(){
            while(mod_exists("area", mod_current)){
                with(Player) if button_pressed(index, "key4"){
                    with instance_create(x, y, Portal) endgame = 5;
                    with(GameCont){
                        area = mod_current;
                        subarea = 0;
                    }
                }
                wait(0);
            }
            exit;
        }
    }
    
#macro DEBUG                    false // remember to set to false before sharing
    
#macro area_backcol             make_color_rgb(66, 53, 36)
#macro area_shadcol             make_color_rgb(000,     000,    000)

#macro area_amb                 amb0;
#macro area_mus                 mus7b;

#macro spr                      global.spr

 // Number of subareas:
#macro subareas                 1

 // The area after this one:
#macro nextarea                 7
#macro nsubarea                 2

#define area_name(_subarea, _loops) return "7-?";
#define area_ttip return choose("Challenge Them","Spirit","Press E to die instantly")

#define area_sprite(_sprite)
    switch(_sprite){
         // Floors:
        case sprFloor1 :        return spr.AreaFloor;
        case sprFloor1B :       return spr.AreaFloorB;
        case sprFloor1Explo :   return spr.AreaFloorExplo;
         // Walls:
        case sprWall1Bot :      return spr.AreaWallBot;
        case sprWall1Top :      return spr.AreaWallTop;
        case sprWall1Out :      return spr.AreaWallOut;
        case sprWall1Trans :    return spr.AreaWallTrans;
         // Misc:
        case sprDebris1 :       return spr.AreaDebris;
    }
    
#define area_setup
	global.shrinespawned = false;
	global.noportals = true;
     // Generation:
    goal = 60;
    safespawn = 0;
     // Misc:
    background_color = area_backcol;
    BackCont.shadcol = area_shadcol;
    GameCont.norads = 0; // disable horror spawn when debugging
	TopCont.Darkness = 1;
     // Music and ambience:
    sound_play_music(area_mus);
    sound_play_ambient(area_amb);
	TopCont.darkness = 1;
			with(instance_create(10016, 10016, CrownPed)) depth = 4;
		with(instance_create(10016, 10016, CustomObject)){
			instance_create(x, y, PortalClear);
			on_step = script_ref_create(exit_step);
			on_draw = script_ref_create(exit_draw);
			itsDone = 0;
			depth = -10;
		}
    
#define area_make_floor
    var _x = x,
        _y = y,
        _inSpawn = point_distance(_x, _y, 10016, 10016) < 48;
        
    instance_create(_x, _y, Floor);
    
    var _turn;
    if random(7) < 7{
        _turn = choose(90, -90, 180);
    }
    direction += _turn;
    
    if _turn == 180 && !_inSpawn{
        instance_create(_x, _y, Floor);
        instance_create(_x + 16, _y + 16, WeaponChest);
    }
    
    if random(19 + instance_number(FloorMaker)) > 22{
        if !_inSpawn{
            instance_create(_x, _y, Floor);
            instance_create(_x + 16, _y + 16, AmmoChest);
        }
        instance_delete(id);
    }
    
    if random(1) < 1{
        instance_create(_x, _y, FloorMaker);
    }
    
#define area_pop_enemies
    var _x = x + 16,
        _y = y + 16;
        
#define area_pop_props
    var _x =                    x + 16 + orandom(6),
        _y =                    y + 16 + orandom(6),
        _boneChance =           1 / 10,
        _quarterWallChance =    0 / 4,
        _propChance =           0 / 4;
        

    if random(1) <= _quarterWallChance{
         // Spawn quarter walls:
        if point_distance(x,y,10016,10016) > 100 && !place_meeting(x,y,NOWALLSHEREPLEASE){
            var _x = x+choose(0,16),
                _y = y+choose(0,16);
            if !place_meeting(_x,_y,hitme){
                instance_create(_x,_y,Wall);
                instance_create(x,y,NOWALLSHEREPLEASE);
            }
        }
    }
    else if random(1) <= _propChance{
         // Spawn props:
        instance_create(_x, _y, Pillar);
    }
        
#define area_pop_chests
     // Base number of chests for each type:
    gol =   0;
     // Number of extra chests for each type: (ammo, weapon, rads)
    agol =  0;
    wgol =  0;
    rgol =  0;
    

#define area_pop_extras
    var _topDecalChance = 1 / 200;
     // No top decals.
    
#define area_start
     // Setup scripts:
		TopCont.darkness = 1;
         // Step:
        if !array_length(instances_matching(CustomStep, "name", string(mod_current) + "_step"))
            with script_bind_step(area_step, 0) name = string(mod_current) + "_step";
        
#define area_step
    if instance_exists(WantPopo) with(WantPopo) instance_destroy();
    if instance_exists(IDPDSpawn) with(IDPDSpawn) instance_destroy();
    if instance_exists(Portal) && global.noportals = 1{
	with(Portal) instance_destroy();
	}
if !instance_exists(GenCont){
if (global.shrinespawned == false){		//yokin's script. he made this happen. Cheers!
  global.shrinespawned = true;
  
  var floors = instances_matching(Floor, mod_current, undefined);
  var rand_num = irandom_range(0, array_length(floors) - 1);
  
  with(floors[rand_num]){
    with instance_create(x + 16, y + 16, CustomObject){
			name = "GunShrine"
			sprite_index = sprThroneStatue;
			instance_create(x+15, y+15, PortalClear);
			instance_create(x-15, y-15, PortalClear);
			instance_create(x-15, y+15, PortalClear);
			instance_create(x+15, y-15, PortalClear);
			on_step = script_ref_create(shrine_step);
			on_draw = script_ref_create(shrine_draw);
			DudeSpawn = 0;
      }
    }
  }
}


#define area_finish
    lastarea = area;
    subarea++;
    
    if background_color == area_backcol && subarea > subareas{
        area =      nextarea;
        subarea =   nsubarea;
    }
		sound_play_music(mus7b);
    
#define area_transit

#define area_secret
    return true;
    
#define area_mapdata(_lx, _ly, _la, _lsa, _sa, _l)
    return [_lx, area_secret() * 9, (_sa == 1), true];
    
#define obj_create(_x, _y, _obj)
    var o = noone;
    switch(_obj){
        case "ShrineBoss" :
            o = instance_create(_x, _y, CustomEnemy);
            with(o){
                 // Visual:
                spr_idle = sprOldGuardianIdle;
                spr_walk = sprOldGuardianIdle;
                spr_hurt = sprOldGuardianHurt;
                spr_dead = sprOldGuardianDead;
                spr_weapon = sprBanditGun;
                spr_shadow = shd24;
                sprite_index = spr_idle;
                mask_index = mskBanditBoss;
                //depth = 0;
                
                 // Sounds:
                snd_hurt = sndBanditHit;
                snd_dead = sndBanditDie;
                
                 // Variables:
				bossname = "Spirit"
                maxhealth =     500 + (GameCont.loops * 50);
                raddrop =       80;
                size =          3;
                walk =          0;
                gunangle =      irandom(359);
                direction =     irandom(359);
				alarm0 =        60 + irandom(20);
				alarm1 =        40 + irandom(20);
                alarm2 =        50 + irandom(30);
				alarm3 =        90 + irandom(50);
				alarm4 =        140 + irandom(50);
				alarm5 =        60 + irandom(20);
				alarm6 =		100;
				alarm7 =		70 + irandom(20);
				alarm8 =		120;
				lowhp = false;
				intro = 0;
            }
            break;
            
        default : return ["ShrineBoss"];
    }
    
    with(o){
         // Auto-assign name:
        name = _obj;
        
         // Auto-fill health:
        if variable_instance_exists(o, "my_health"){
            my_health = maxhealth;
            on_hurt =   script_ref_create(enemy_hurt);
            on_death =  script_ref_create(enemy_death);
            on_draw =   script_ref_create(enemy_draw);
        }
        
         // Auto-assign scripts:
        var a = ["_step", "_draw", "_hurt", "_death"];
        for (var i = 0; i < array_length(a); i++){
            var _scrVar = "on" + a[i], 
                _scrRef = name + a[i];
            if mod_script_exists("area", mod_current, _scrRef)
                variable_instance_set(o, _scrVar, _scrRef);
        }
    }
    
     // Returns the instance for with calls:
    return o;

#define ShrineBoss_step
    enemy_alarms(2);
    enemy_move(0.8, 1.5);
    enemy_sprites();
	
	if my_health <= (maxhealth * 0.5) && lowhp = false{		//Low Health Noise And Enter Phase Two
	lowhp = true;
	my_health += 50
	sound_play_pitchvol(sndExploGuardianCharge,1.5,1.5)
	instance_create(x,y,AmmoPickup)
	instance_create(x,y,HPPickup)
	}
	if intro=0{
	if UberCont.opt_bossintros = 1 mod_script_call('mod', 'bossintros', 'boss_trigger', 'SPIRIT', mskNone, mskNone, mskNone, self, 60);
	intro = 1
	}
	
		//Alarm for moving
        if alarm0 > 0 alarm0 -= 1;
        else script_execute(ShrineBoss_alrm0);
		
		//Alarm for aiming
        if alarm1 > 0 alarm1 -= 1;
        else script_execute(ShrineBoss_alrm1);
    
        //Alarm for Spread Attack
        if instance_exists(self) && alarm2 > 0 alarm2 -= 1;
        else if enemy_target_seen() script_execute(ShrineBoss_alrm2);
		
		//Alarm for Flak Attack
        if instance_exists(self) && alarm3 > 0 alarm3 -= 1;
        else if enemy_target_seen() script_execute(ShrineBoss_alrm3);

		//Alarm for Anti-Melee Attack
        if instance_exists(self) && alarm4 > 0 alarm4 -= 1;
        else if enemy_target_seen() script_execute(ShrineBoss_alrm4);
		
		//Alarm for Ring Attack
        if instance_exists(self) && alarm5 > 0 alarm5 -= 1;
        else if enemy_target_seen() script_execute(ShrineBoss_alrm5);
		
		//Alarm for Spin Hell
        if instance_exists(self) && alarm6 > 0 alarm6 -= 1;
        else if enemy_target_seen() script_execute(ShrineBoss_alrm6);
		
		//Alarm for Backup
		if lowhp = true{
        if instance_exists(self) && alarm7 > 0 alarm7 -= 1;
        else if enemy_target_seen() script_execute(ShrineBoss_alrm7);
		}
		
		//Alarm for Ammo
		if lowhp = true{
        if instance_exists(self) && alarm8 > 0 alarm8 -= 1;
        else if enemy_target_seen() script_execute(ShrineBoss_alrm8);
		}

#define ShrineBoss_alrm0	// Move
    alarm0 = 10 + irandom(5);
	if lowhp = false{
if random(3) < 1 enemy_walk(10 + irandom(3), direction + orandom(90));
    right = enemy_right(gunangle);
}else{
if random(5) < 1 enemy_walk(10 + irandom(3), direction + random_range(-10,10));
}
	
#define ShrineBoss_alrm1	// Aim
if instance_exists(Player){
    alarm1 = 5 + irandom(5);
    target = instance_nearest(x, y, Player);
    if enemy_target_seen(){
        gunangle = point_direction(x, y, target.x, target.y);
    }else{			// If hiding like a little coward, Break down the Bitch's Cover
	gunangle = point_direction(x, y, target.x, target.y);
	alarm1 += 5;
	with instance_create(x,y,CustomProjectile){
	team = other.team;
	sprite_index = sprEnemyBullet1;
	speed = 10;
	direction = other.gunangle;
	image_angle = direction;
	image_index = 1;
	image_speed = 0;
	on_destroy = script_ref_create(WallBreaker);
	}
  }
}

#define ShrineBoss_alrm2
    alarm2 = 20 + irandom(2);
	
	
        if point_distance(x, y, target.x, target.y) > 64 && random(2) < 1{
			if lowhp=false{
            enemy_fire(x, y, ThroneBeam, gunangle, 6);
			enemy_fire(x, y, ThroneBeam, gunangle+15, 5);
			enemy_fire(x, y, ThroneBeam, gunangle-15, 5);
			enemy_fire(x, y, ThroneBeam, gunangle+30, 4);
			enemy_fire(x, y, ThroneBeam, gunangle-30, 4);
			enemy_fire(x, y, ThroneBeam, gunangle-45, 3);
			enemy_fire(x, y, ThroneBeam, gunangle+45, 3);
			if GameCont.loops > 0{
			repeat(GameCont.loops - 1){
			enemy_fire(x, y, ThroneBeam, gunangle + random_range(20,-20), random_range(2,5))
			  }
			}
            sound_play(sndEnemyFire);
			}else{
			if irandom(1)=1{
			            enemy_fire(x, y, ThroneBeam, gunangle, 10);
			enemy_fire(x, y, ThroneBeam, gunangle+3, 7);
			enemy_fire(x, y, ThroneBeam, gunangle-3, 7);
			enemy_fire(x, y, ThroneBeam, gunangle+6, 6);
			enemy_fire(x, y, ThroneBeam, gunangle-6, 6);
			enemy_fire(x, y, ThroneBeam, gunangle-60, 3);
			enemy_fire(x, y, ThroneBeam, gunangle+60, 3);
			}else{
						            enemy_fire(x, y, ThroneBeam, gunangle, 8);
			enemy_fire(x, y, ThroneBeam, gunangle+8, 4);
			enemy_fire(x, y, ThroneBeam, gunangle-8, 4);
			enemy_fire(x, y, ThroneBeam, gunangle+16, 6);
			enemy_fire(x, y, ThroneBeam, gunangle-16, 6);
			enemy_fire(x, y, ThroneBeam, gunangle-8, 3);
			enemy_fire(x, y, ThroneBeam, gunangle+8, 3);
			}
		}
	}
    
    if random(3) < 1 enemy_walk(10 + irandom(20), direction + orandom(90));
    right = enemy_right(gunangle);
	
	#define ShrineBoss_alrm3
	if instance_exists(Player){
	alarm3 = 120 + irandom(30)
	if point_distance(x, y, target.x, target.y) > 10{
	instance_create(x,y-17,AssassinNotice)
    sound_play_pitchvol(sndEliteInspectorAlarmed,1.5,0.7);
	wait(15)
			if instance_exists(self){
	if lowhp=false{
		repeat(15 + (GameCont.loops * 3)){
            enemy_fire(x, y, EnemyBullet3, gunangle + random_range(45,-45), random_range(7,12 + GameCont.loops));
            sound_play(sndEnemyFire);
			}
        }else{
		alarm3 += 30
		alarm4 += 30
		alarm5 += 30
		alarm6 += 30
			enemy_fire(x, y, LHBouncer, gunangle+60, 6);
			enemy_fire(x, y, LHBouncer, gunangle-60, 6);
			enemy_fire(x, y, LHBouncer, gunangle+10, 4);
			enemy_fire(x, y, LHBouncer, gunangle-10, 4);
			enemy_fire(x, y, LHBouncer, gunangle+20, 6);
			enemy_fire(x, y, LHBouncer, gunangle-20, 6);
			enemy_fire(x, y, LHBouncer, gunangle+45, 3);
			enemy_fire(x, y, LHBouncer, gunangle-45,3);
			}
		}
	}
}
		
	#define ShrineBoss_alrm4
	alarm4 = 140 + irandom(25)
        if point_distance(x, y, target.x, target.y) > 10{
	with instance_create(x,y-17,AssassinNotice){
	image_blend = c_blue;
	}
    sound_play_pitchvol(sndExploGuardianFire,2.5,0.8);
	wait(15)
		if lowhp = false{
	repeat(GameCont.loops){
	if instance_exists(self){
	with instance_create(x,y,CustomProjectile){
	hitid = [sprOldGuardianIdle,"Spirit"]
	team = other.team;
	sprite_index = sprPopoPlasma;
	exploded = 0;
	image_index = 1;
	image_speed = 0;
	speed = 6;
	damage = 3;
	direction = other.gunangle + 3;
	image_angle = direction;
	on_step = script_ref_create(UnmeleeStep);
	on_destroy = script_ref_create(UnmeleeDestroy);
	}
		with instance_create(x,y,CustomProjectile){
	hitid = [sprOldGuardianIdle,"Spirit"]
	team = other.team;
	sprite_index = sprPopoPlasma;
	exploded = 0;
	image_index = 1;
	image_speed = 0;
	speed = 6;
	damage = 3;
	direction = other.gunangle - 3;
	image_angle = direction;
	on_step = script_ref_create(UnmeleeStep);
	on_destroy = script_ref_create(UnmeleeDestroy);
	}
  }
}
wait(2)
script_execute(ShrineBoss_alrm1);
}else{
	alarm3 += 55
	alarm4 += 55
	alarm5 += 55
	alarm6 += 55
	alarm4 += 55
			enemy_fire(x, y, EFlakBullet, gunangle, 11);
			enemy_fire(x, y, EFlakBullet, gunangle+45, 5);
			enemy_fire(x, y, EFlakBullet, gunangle-45, 5);
  }
}

	#define ShrineBoss_alrm5
	if instance_exists(Player){
	alarm5 = 160 + irandom(50)
	if lowhp = false{
	sound_play(sndBigBallFire);
	for (i = 0; i < 360; i += 15)
{
enemy_fire(x,y,GuardianBullet,i,3)
}
}else{
	sound_play(sndBigBallFire);
	offseet = gunangle
	alarm3 += 50
	alarm4 += 50
	alarm5 += 50
	alarm6 += 50
	if(instance_exists(self)){
	for (i = 0; i < 360; i += 14)
{
	if(instance_exists(self)){
enemy_fire(x,y,GuardianBullet,i+ offseet,3)
enemy_fire(x,y,GuardianBullet,+ offseet + (i*-1),3)
sound_play(sndEnemyFire)
wait(1)
}
}
}
}
}

	#define ShrineBoss_alrm6
	if instance_exists(Player){
	alarm1 = 50 + irandom(50)
 	alarm2 = 50 + irandom(50)
	alarm3 = 50 + irandom(50)
	alarm4 = 50 + irandom(50)
	alarm5 = 50 + irandom(50)
	alarm6 = 300 + irandom(100)
		if lowhp = false{
	for (i = 0; i < 90 i += 16)
{
enemy_fire(x,y,ThroneBeam,gunangle+i,3)
enemy_fire(x,y,ThroneBeam,gunangle+-i,3)
enemy_fire(x,y,ThroneBeam,gunangle+(i*0.5),5)
enemy_fire(x,y,ThroneBeam,gunangle+(-i*0.5),5)
sound_play(sndEnemyFire)
wait(2)
}
}else{
	for (i = 0; i < 90 i += 15)
{
enemy_fire(x,y,ThroneBeam,gunangle+i,4)
enemy_fire(x,y,ThroneBeam,gunangle+-i,4)
enemy_fire(x,y,ThroneBeam,gunangle+i,5)
enemy_fire(x,y,ThroneBeam,gunangle+-i,5)
enemy_fire(x,y,ThroneBeam,gunangle+i,6)
enemy_fire(x,y,ThroneBeam,gunangle+-i,6)
sound_play(sndEnemyFire)
wait(6)
}
}
}

#define ShrineBoss_alrm7
    alarm7 = 150 + irandom(40);
instance_create(x+random_range(-20,20),y+random_range(-20,20),Guardian)

#define ShrineBoss_alrm8
    alarm8 = 190
instance_create(x+random_range(-20,20),y+random_range(-20,20),AmmoPickup)
    
    
#define enemy_fire(_x, _y, _obj, _dir, _spd)
    var o = create_mixed(_x, _y, _obj);
    with(o){
        creator = other;
        team = creator.team;
        speed = _spd;
        direction = _dir;
        image_angle = direction;
		hitid = [sprOldGuardianIdle,"Spirit"]
		
    }
    return o;
    
#define enemy_target_seen
if instance_exists(self){
    if instance_exists(target) return !collision_line(x, y, target.x, target.y, Wall, false, false);
    return false;
}
    
#define enemy_alarms(_alarms)
    for (var i = 0; i <= array_length(_alarms); i++){
        var s = name + "_alrm" + string(i);
        if alarm_get(i) > 0
            alarm_set(i, alarm_get(i) - current_time_scale);
        if alarm_get(i) <= 0 && mod_script_exists("area", mod_current, s)
            mod_script_call("area", mod_current, s);
    }
    
#define enemy_move(_walkspd, _maxspd)
    if walk{
        walk -= current_time_scale;
        motion_add_ct(direction, _walkspd);
    }
    speed = min(speed, _maxspd);
    if place_meeting(x + hspeed, y + vspeed, Wall) move_bounce_solid(false);
    
#define enemy_walk(_walk, _dir)
    walk = _walk;
    direction = _dir;
    
#define enemy_right(_dir)
    var r = sign(lengthdir_x(1, _dir));
    if r == 0
        r = 1;
    return r;
    
#define enemy_sprites
    if sprite_index != spr_hurt{
        if speed <= 0 sprite_index = spr_idle;
        else if sprite_index == spr_idle sprite_index = spr_walk;
    }
    else if nexthurt <= current_frame
        sprite_index = spr_idle;
    
#define enemy_hurt(_dmg, _spd, _dir)
    my_health -= _dmg;
    nexthurt = current_frame + 5;
    sprite_index = spr_hurt;
    image_index = 0;
    sound_play_hit(snd_hurt, 0.6);
    motion_add(_dir, (_spd * 0.1));
    
#define enemy_death
sound_play(sndBossWin)
sound_play_music(musBossDead);
	repeat(5){
    pickup_drop(100, 0);
}
	repeat(4){
	with instance_create(x,y,WepPickup){
			scrGimmeWep(x,y,14,(GameCont.hard + 15),curse,0)
			instance_destroy()
		}
	}
	if GameCont.loops >= 2{
		with instance_create(x,y,WepPickup){
			wep = "omegarevolver"
		}
	}
	
    
#define enemy_draw
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * right, image_yscale, image_angle, image_blend, image_alpha);
     // Draw weapon:
    if variable_instance_exists(id, "spr_weapon") draw_sprite_ext(spr_weapon, 1, x, y, image_xscale, image_yscale * enemy_right(gunangle), image_angle + gunangle, image_blend, image_alpha);
    
#define floor_fill(_x, _y, _width, _height)
     // Makes a rectangle of floors:
    var o = 32;
    _x -= floor(_width / 2) * o;
    _y -= floor(_height / 2) * o;
    
    for (var _xo = 0; _xo <= _width; _xo++)
        for (var _yo = 0; _yo <= _height; _yo++)
            instance_create(_x + _xo * o, _y + _yo * o, Floor);

#define create_mixed(_x, _y, _obj)
     // Spawns custom enemies and vanilla ones with their respective functions:
    if is_string(_obj) return obj_create(_x, _y, _obj);
    return instance_create(_x, _y, _obj);
    
#define orandom(n) return irandom_range(-n, n);

#define exit_step
	with(Player) if distance_to_object(other) < 16 && button_pressed(index, "pick") && !instance_exists(Spiral) && !instance_exists(enemy){
		if other.itsDone != 1 with(other){
			script_execute(exit_time);
			itsDone = 1;
		}
	}
		
#define exit_draw
	if distance_to_object(Player) < 16{
	if !instance_exists(enemy){
			draw_set_halign(fa_center);
		draw_text_nt(x, y-32, "@wEXIT");
		draw_set_halign(fa_left);
		draw_sprite(sprEPickup, 0, x, y-8);
		}else{
		draw_set_font(fntSmall);
			draw_set_halign(fa_center);
		draw_text_nt(x, y-32, "@dLOCKED!");
		draw_set_halign(fa_left);
		}
	}
	
#define exit_time
	with(instance_create(x, y, Portal)) type = 2;
	global.noportals = 0;
	
#define shrine_step
if distance_to_object(CrownPed) < 8{
x += choose(32,-32)
y += choose(32,-32)
}
	with(Player) if distance_to_object(other) < 16 && button_pressed(index, "pick") && !instance_exists(Spiral){
		if other.DudeSpawn != 1 with(other){
			DudeSpawn = 1;
			script_execute(shrine_time);
		}
	}
		
#define shrine_draw
	if distance_to_object(Player) < 8{
			draw_set_halign(fa_center);
		draw_text_nt(x, y-32, "@wCHALLENGE");
		draw_set_halign(fa_left);
		draw_sprite(sprEPickup, 0, x, y-8);
		}
	
#define shrine_time
	obj_create(x, y, "ShrineBoss")
	TopCont.darkness = 0
	sound_play_music(musBoss4A);
			instance_destroy();
			
#define WallBreaker
instance_create(x,y,PortalClear);
with instance_create(x,y,Explosion){
image_xscale = 0.8;
image_yscale = 0.8;
team = other.team
}

#define UnmeleeStep
if place_meeting(x,y,Slash) || place_meeting(x,y,EnergySlash) || place_meeting(x,y,Shank) || place_meeting(x,y,EnergyShank) || place_meeting(x,y,EnergyHammerSlash) || place_meeting(x,y,LightningSlash) || place_meeting(x,y,CustomSlash){
with instance_create(x,y,PlasmaImpact){
		hitid = [sprOldGuardianIdle,"Spirit"]
		sprite_index = sprPopoPlasmaImpact
		image_xscale = 1.5;
		image_yscale = 1.5;	
		team = other.team;
		damage = 3;
  }
repeat(10){
with instance_create(x,y,ThroneBeam){
		hitid = [sprOldGuardianIdle,"Spirit"]
		motion_add(random(360),5)
		image_angle = direction
		team = other.team;
		}
	}
  exploded=1;
  instance_destroy()
}

#define UnmeleeDestroy
with instance_create(x,y,BulletHit){
sprite_index = sprGuardianBulletHit
}
if exploded=0{
sound_play(sndPlasmaHit)
with instance_create(x,y,PlasmaImpact){
		hitid = [sprOldGuardianIdle,"Spirit"]
		sprite_index = sprPopoPlasmaImpact
		image_xscale = 1.3;
		image_yscale = 1.3;
		team = other.team;
		damage = 3;
  }
}

if !skill_get(4){
if irandom(1) = 0{
instance_create(x,y,choose(AmmoPickup,HPPickup))
}
}else{
instance_create(x,y,choose(AmmoPickup,HPPickup))
}

#define scrGimmeWep(_x, _y, _minhard, _maxhard, _curse, _nowep) // Thanks to Yokin for this script!
    var _list = ds_list_create(),
        s = weapon_get_list(_list, _minhard, _maxhard);

    ds_list_shuffle(_list);

    with(instance_create(_x, _y, WepPickup)){
        curse = _curse;
        ammo = 0;

        for(i = 0; i < s; i++) {
            var    w = ds_list_find_value(_list, i),
                c = 0;

             // Weapon Exceptions:
            if(is_array(_nowep) && array_find_index(_nowep, w) >= 0) c = 1;
            if(w == _nowep) c = 1;

             // Specific Weapon Spawn Conditions:
            if(!is_string(w)) switch(w){
                case wep_super_disc_gun:        if(curse <= 0)            c = 1; break;
                case wep_golden_nuke_launcher:  if(!UberCont.hardmode)    c = 1; break;
                case wep_golden_disc_gun:       if(!UberCont.hardmode)    c = 1; break;
                case wep_gun_gun:               if(GameCont.crown != 5)    c = 1; break;
            }

            if(c) continue;
            break;
        }

         // Set Weapon:
        if(!c) wep = w;
        else wep = wep_screwdriver; // Default
	rolled = 1;

        ds_list_destroy(_list);

        return id;
    }