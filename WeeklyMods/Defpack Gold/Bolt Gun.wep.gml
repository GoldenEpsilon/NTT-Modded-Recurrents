#define init
global.sprBoltGun = sprite_add_weapon("Bolt Gun.png", 4, 3);

#define weapon_name
return "BOLT GUN"

#define weapon_sprt
return global.sprBoltGun;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 28;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 10;

#define weapon_text
return "HEAR THE NEEDLE DROP";

#define weapon_fire

sound_play(sndGrenadeRifle)
wkick = 9
with instance_create(x,y,Bolt)
{
	team = other.team
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-5,5)*other.accuracy,20)
	image_angle = direction
}
with instance_create(x,y,HeavyBolt)
{
	team = other.team
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-2,2)*other.accuracy,12)
	image_angle = direction
}
repeat(2)
{
	with instance_create(x,y,Seeker)
	{
		team = other.team
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-25,25)*other.accuracy,8)
		image_angle = direction
	}
}
repeat(4)
{
	with instance_create(x,y,Splinter)
	{
		team = other.team
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-35,35)*other.accuracy,20)
		image_angle = direction
	}
}
