// /loadlive mods/crazybandits.mod.gml

#define init
global.parray = [EnemyBullet1, EnemyBullet1, EnemyBullet1, EnemyBullet4, EnemyBullet3, EnemyBullet1, LHBouncer, EnemyBullet3, EFlakBullet, EnemyBullet3];
global.earray = [Bandit, BanditBoss, Raven, Sniper, JungleBandit, LilHunter, LilHunter, Gator, BuffGator, EFlakBullet];
global.drawer = noone;

#define step
if(!instance_exists(global.drawer)
&& instance_exists(enemy))
{
	global.drawer = instance_create(0, 0, CustomObject);
	with(global.drawer)
	{
		script_bind_draw(draw_guns, enemy.depth - 1);
	}
}
if instance_exists(FireCont){
	FireCont.accuracy = 1
	FireCont.index = -1
	FireCont.ammo = [100,100,100,100,100,100]
}
with(EFlakBullet){
	if "target" not in self{
		target = -1;
		mask_index = mskNone;
	}
}
for(var i = 0; i < array_length_1d(global.earray); i += 1)
{
	with(global.earray[i])
	{
		wkick = 9999;
		if("wep_processed" not in self)
		{
			maxalarm1 = alarm1;
			canswing = 0;
			walkdir = 0;
			wep_processed = 1;
			wepangle = 0;
			var charmod = 0;
			if object_index = BanditBoss{
				charmod = 4;//wep = choose(26, 28, 35, 49, 51, 55, 66, 68, 72, 79, 97);
			}
			var weplist = ds_list_create();
			weapon_get_list(weplist, 0, GameCont.hard + charmod);
			ds_list_remove(weplist,67);
			wep =(ds_list_find_value(weplist, irandom(ds_list_size(weplist) - 1)));
			ds_list_destroy(weplist);
			if weapon_get_type(wep) = 0 wepangle = 120;
			
			if object_index = Sniper{
				wep = choose(wep,wep,wep,wep,wep,wep,11,12,31,66);
				//60% chance to retain wepaon, 
				//40% chance to choose one of five Bolt weapons
			}
			if object_index = JungleBandit{
				if random(10) < 1 wep = 51;
			}
		}
		if weapon_is_melee(wep) && object_index != BuffGator && object_index != EFlakBullet{
			if canswing > 0 canswing --;
			if instance_exists(target)  && target != -1{
				if distance_to_object(target) <= 48 && canswing <= 0{
					gunangle = point_direction(x,y,target.x,target.y);
					if target.x > x right = 1
						else right = -1;
					var _fire = player_fire_ext(gunangle, wep, x, y, team, id);
					if wepangle = 120 wepangle = -120
							else wepangle = 120;
					canswing = _fire.reload;
				}
				if distance_to_object(target) > 32 && alarm1 <= maxalarm1 / 2{
					walk = 20 + random(40);
					alarm1 = walk;
					walkdir = -1;
				}
				if walk > 0 && walkdir = -1{
					if !collision_line(x,y,target.x,target.y,Wall,0,1) && distance_to_object(target) > 32{
						walkdir = point_direction(x,y,target.x,target.y) + choose(random_range(-30,30),random_range(-60,60));
						direction = walkdir;
					}
				}
				if walk = 0{
					walkdir = -1
				}
			}
		}
	}
}

for(var i = 0; i < array_length_1d(global.parray); i += 1)
{
	with(global.parray[i])
	{
		var creator = instance_nearest(xstart, ystart, hitme);
		if(creator.object_index == global.earray[i])
		{
			if(instance_exists(creator))
			{
				wep_processed = 1;
				if object_index != EFlakBullet{
					with(creator)
					{
						var _o = other;
						var _fire = player_fire_ext(_o.direction, wep, x, y, team, id);
						if weapon_get_type(wep) = 0  || wep = 53 || wep = 24 || wep = 36{
							if wepangle = 120 wepangle = -120
								else wepangle = 120;
						}else wepangle = 0;
						if _fire.reload > alarm1 alarm1 = _fire.reload
					}
					instance_destroy();
				}else{
					wep = creator.wep;
					target = id;
					if speed < 1 || (distance_to_object(Wall) < 1 || distance_to_object(Player) < 1 || distance_to_object(Ally) < 1 || distance_to_object(prop) < 1){
						repeat (10){
							var _fire = player_fire_ext(random(360), wep, x, y, team, id);
							if weapon_is_melee(wep){
								if wepangle = 120 wepangle = -120
									else wepangle = 120;
							}else wepangle = 0;
						}
						sound_play(sndFlakExplode);
						repeat (6) with (instance_create(x, y, Smoke)) motion_add(random(360), random(3));
						with (instance_create(x, y, BulletHit)) sprite_index = sprEFlakHit;
						instance_change(Wind,false);
					}
				}
			}
		}
	}
}
#define draw_guns
for(var i = 0; i < array_length_1d(global.earray); i += 1)
{
	with(global.earray[i])
	{
		if("wep_processed" in self)
		{
			if "right" in self draw_sprite_ext(weapon_get_sprite(wep), 0, x, y, 1, right, gunangle+wepangle, c_white, 1);
		}
	}
}
