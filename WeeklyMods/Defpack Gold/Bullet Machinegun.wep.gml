#define init
global.sprBulletMachinegun = sprite_add_weapon("Bullet Machinegun.png", 2, 1);

#define weapon_name
return "BULLET MACHINEGUN";

#define weapon_sprt
return global.sprBulletMachinegun;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 7;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapPistol;

#define weapon_area
return 13;

#define weapon_text
return "OUR POWERS COMBINED";

#define weapon_fire

wkick = 3
sound_play(sndMachinegun)
repeat(4)
{
	with instance_create(x,y,Shell)
	{
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+other.right*100+random(50)-25,2+random(5))
		image_blend = c_purple
	}
}
with instance_create(x+lengthdir_x(20,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(20,point_direction(x,y,mouse_x[index],mouse_y[index])),Bullet1)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-14,14)*other.accuracy,16)
	team = other.team
}
with instance_create(x+lengthdir_x(20,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(20,point_direction(x,y,mouse_x[index],mouse_y[index])),BouncerBullet)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-14,14)*other.accuracy,8)
	team = other.team
}
with instance_create(x+lengthdir_x(20,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(20,point_direction(x,y,mouse_x[index],mouse_y[index])),HeavyBullet)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-14,14)*other.accuracy,14)
	team = other.team
}
with instance_create(x+lengthdir_x(20,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(20,point_direction(x,y,mouse_x[index],mouse_y[index])),Bullet1)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-14,14)*other.accuracy,16)
	image_angle = direction
	image_xscale *= 1.2
	image_yscale *= 1.2
	team = other.team
	damage *= 2
	speed /= 4
	timer = 15
	image_blend = c_purple
	do
	{
		timer -= 1
		if timer < 0
		{
			timer = 0
		}
		if timer = 0
		{
			if instance_exists(enemy)
			{
				if collision_line(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y,Wall,0,0) < 0
				{
					if distance_to_object(instance_nearest(x,y,enemy)) < 200
					{
							motion_add(point_direction(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y),0.9)
							image_angle = direction
					}
				}
			}
		}
	wait 1
	}while (instance_exists(self))
}
