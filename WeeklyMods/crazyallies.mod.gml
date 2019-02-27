#define init
global.drawer = noone;
global.LEVELBEGIN = 0;

#define step
with Player if race = "rebel" && canspec = 1{
	canspec = 0
}
//Drawing guns, stolen from 9joao6's Gun Allies
if(!instance_exists(global.drawer)
&& instance_exists(Ally))
{
	global.drawer = instance_create(0, 0, CustomObject);
	with(global.drawer)
	{
		script_bind_draw(draw_guns, -3);
	}
}
with Player if race = "rebel" && button_pressed(index,"spec"){
	var me = self;
	with WepPickup if point_seen(x,y,other.index){
		repeat 1 + ultra_get("rebel", 2){
			with instance_create(x,y,Ally){
				creator = me;
				team = me.team;
				wep = other.wep
				walk = 1
				gunspr = mskNone
			}
			with Ally {my_health = maxhealth}
		}
	instance_destroy()
	}
}

with(Ally)
{	//Setting up the ally, stolen from 9joao6's Gun Allies
	if("gunally" not in self)
	{
		gunally = 1;
		canswing = 0;
		maxalarm1 = alarm1;
		walkdir = 0;
		wepangle = 0;
	}
	//Melee AI, stolen straight from Saniblues' Crazy Bandits mod
	if (weapon_get_type(wep) = 0 || wep = 53 || wep = 24 || wep = 36 || weapon_is_melee(wep)){
		if canswing > 0 canswing --;
		if instance_exists(target)  && target != -1 && target.object_index != Portal{
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
/// Portal related, stolen straight from Saniblues' unnamed Rebel mod
if (instance_exists(Portal)){
	global.LEVELBEGIN = 0;
	with(Ally){
		// "Endgame" variable. For disappearing into a portal.
		if ("endme" not in self){
			endme = 40;
		}
		if !(visible) || instance_exists(Spiral){
			alarm1++;
			alarm2++;
			speed = 0;
		}else{
			if !instance_exists(enemy) && sprite_index != sprAllyAppear{
				alarm2++;
				target = instance_nearest(x,y,Portal);
				walk = 1;
				if collision_line(x,y,target.x,target.y,Wall,0,1) mp_potential_step(target.x,target.y,2,false)
					else direction = point_direction(x,y,target.x,target.y);
			}
			/// This shit was copied right out of u19
			if point_distance(x,y,Portal.x,Portal.y) < 96 and collision_line(x,y,Portal.x,Portal.y,Wall,0,0) < 0{
				walk = 0;
				if place_free(x+lengthdir_x(5,point_direction(x,y,Portal.x,Portal.y)),y)
						x += lengthdir_x(5,point_direction(x,y,Portal.x,Portal.y));
				if place_free(x,y+lengthdir_y(5,point_direction(x,y,Portal.x,Portal.y)))
					y += lengthdir_y(5,point_direction(x,y,Portal.x,Portal.y));
				image_angle -= 30*right
				sprite_index = spr_hurt
				depth = -9
				image_index = 1
				if endme > 0 endme--;
				if (endme <= 0){
					visible = false;
					persistent = 1;
				}
			}else{
				image_angle = 0
			}
		}
	}
}
with(Ally){
	if instance_exists(Player){
		if global.LEVELBEGIN == 1 && persistent = 1 && Player.visible = 1{
			persistent = 0;
			visible = 1;
			my_health = maxhealth;
			x = Player.x;
			y = Player.y;
			depth = -2;
		}else{
			alarm2++;
		}
		if !(visible){
			x = Player.x;
			y = Player.y;
			image_angle = 0;
		}
	}else instance_change(Wind,false);
}
if !instance_exists(Spiral) && global.LEVELBEGIN == 0{
	global.LEVELBEGIN = 1;
}

with(AllyBullet)
{
	//if("creator" not in self)
	creator = instance_nearest(xstart, ystart, Ally);
	if(instance_exists(creator)
	&& creator.my_health > 0)
	{
		gunally = 1;
		with(creator)
		{
			var _o = other;
			var rad = GameCont.rad
			with player_fire_ext(_o.direction, wep, x+lengthdir_x(12, _o.direction), y+lengthdir_y(12, _o.direction), team, id){
				accuracy = 1
				index = -1
				ammo = [100,100,100,100,100,100]
				wep = other.wep
				var _fire = self;
			}
			GameCont.rad = rad
			wepangle = _fire.wepangle;
			alarm1 = _fire.reload/(skill_get(5)+1);
		}
	}
	instance_destroy();
}

#define draw_guns
with Ally
{
	if("gunally" in self && visible = 1)
	{
		draw_sprite_ext(weapon_get_sprite(wep), 0, x + lengthdir_x(wkick,gunangle), y + lengthdir_y(wkick,gunangle), 1, right, gunangle+wepangle, c_white, 1);
	}
}