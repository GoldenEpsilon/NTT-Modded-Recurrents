#define init
	global.spr = {
		Idle : sprBanditIdle,//sprite_add("sprFlakShotgun.png", 0,4, 4),
		Anim : sprBanditIdle,//sprite_add_weapon("sprFlakShotgun.png", 4, 4),
		Fire : sprBanditHurt//sprite_add("sprFlakShotgunAnim.png", 11, 4, 4)
	}
	global.info = {
		name : '"GUN" BY PAUL VEER',
		area : 11,
		swap : sndSwapExplosive,
		text : "540/600",
		type : 2,
		auto : true, //false,
		load : 30, //47,
		cost : 0 //8;
	}

// I put this in a LWO defined at the beginning of the script so I wouldn't have to edit all of this stuff manually
#define weapon_name
return global.info.name;
#define weapon_type
return global.info.type;
#define weapon_auto
return global.info.auto;
#define weapon_load
return global.info.load;
#define weapon_cost
return global.info.cost;
#define weapon_swap
return global.info.swap;
#define weapon_area
return global.info.area;
#define weapon_text
return global.info.text;
#define weapon_sprt_hud
	return global.spr.Idle;

#define weapon_sprt
	if instance_is(self,Player){
		if "gun_sprite" in self{
			gunshine = gun_index;
			return gun_sprite
		}
	}
	return global.spr.Anim;

#define weapon_reloaded
	sound_play(sndShotReload)
	wkick = -1

#define step
	if instance_is(self,Player){
		if "gun_index" not in self{
			gun_index = 0;
			gun_sprite = global.spr.Idle;
		}
		gun_index += 0.40 * current_time_scale;
		if gun_index >= sprite_get_number(gun_sprite){
			if gun_sprite = global.spr.Fire{
				gun_sprite = global.spr.Idle;
			}
		}
	}
#define weapon_fire
	gun_index = 0;
	gun_sprite = global.spr.Fire;
	// Sound:
	sound_play(sndClusterLauncher);
	sound_play(sndBanditHit);

	wepangle = -wepangle;

	with instance_create(x,y,CarThrow){
		sprite_index = sprBanditHurt;
		image_index = 2;
		image_speed = 0;
		team = 2;
		speed = 16;
		direction = point_direction(x,y,mouse_x[other.index],mouse_y[other.index]) + (30 * i);
		image_angle = direction - 90;
		spr_idle = sprBanditHurt;
		spr_hurt = sprBanditHurt;
		spr_dead = sprBanditDead;
		raddrop = 2;
	}
	var dir = point_direction(x,y,mouse_x[index],mouse_y[index]);
	var d = 0;
	var _x = x;
	var _y = y;
	var len = 0;
	for(var i=0;i<=8;i++){
		len += 4
		if collision_line(x,y,x+lengthdir_x(len,dir+180),y+lengthdir_y(len,dir+180),Wall,0,1){
			i = 8;
			lasthit = 69;
			my_health -= 2;
			sound_play(sndHammerHeadProc);
			if my_health <= 0 instance_create(x+lengthdir_x(len,dir+180),y+lengthdir_y(len,dir+180),MeltSplat);
			sound_play(snd_hurt);
			repeat(16)with(instance_create(x,y,Debris)){speed = 10;direction=random(360);}
			with(Wall){
				if distance_to_point(other.x+lengthdir_x(len,dir+180),other.y+lengthdir_y(len,dir+180)) <= 16{
					instance_create(x,y,FloorExplo);
					instance_destroy();
				}
			}
			for(var o = -1; o<=1; o++){
				with(instance_create(x+lengthdir_x(len,dir+180),y+lengthdir_y(len,dir+180),BloodStreak)) direction = dir + 45 - (45 * o);
			}
		}
		if i = 8{
			x += lengthdir_x(len,dir+180);
			y += lengthdir_y(len,dir+180);
			motion_set(dir + 180,4);
			for(var o=1;o<=16;o++){
				instance_create(x - (x - _x) / o,y - (y - _y)/o,Dust);
			}
		}
	}

	 // Weapon Kickback:
	wkick = -6;