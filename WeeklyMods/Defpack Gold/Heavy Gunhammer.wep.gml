#define init
global.sprHeavyGunhammer = sprite_add_weapon("Heavy Gunhammer.png", 4, 8);
weapon_is_melee(1)
#define weapon_name
return "HEAVY GUNHAMMER";

#define weapon_sprt
return global.sprHeavyGunhammer;

#define weapon_type
return 0;

#define weapon_auto
return false;

#define weapon_load
return 28;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 13;

#define weapon_text
return "ADVANCED HAMMERING";

#define weapon_fire

sound_play(sndHammer)
wkick = 6
sound_play(sndHeavyMachinegun)

repeat(3)
{
	with instance_create(x,y,Shell)
	{
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+other.right*100+random(50)-25,2+random(5))
		image_xscale *= 1.2
		image_yscale *= 1.2
	}
}
repeat(6)
		{
			instance_create(x+lengthdir_x(40,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(40,point_direction(x,y,mouse_x[index],mouse_y[index])),Smoke)
		}
with instance_create(x,y,Slash)
{
	dmg = 4
	longarms = 0
	//direction = point_direction(x,y,mouse_x,mouse_y)
	if instance_exists(Player)
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),2+longarms)
	image_angle = direction
	team = other.team
	damage = 4
}
wepangle = -wepangle
motion_add(point_direction(x,y,mouse_x,mouse_y),20)
		with instance_create(x+lengthdir_x(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),HeavyBullet)
		{
			motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(8)-4),16)
			image_angle = direction
			team = other.team
		}
		with instance_create(x+lengthdir_x(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),HeavyBullet)
		{
			motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(8)-4)+4,16)
			image_angle = direction
			team = other.team
		}
			with instance_create(x+lengthdir_x(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),HeavyBullet)
		{
			motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(8)-4)-4,16)
			image_angle = direction
			team = other.team
		}
