#define init
global.sprPsyMinigun = sprite_add_weapon("Psy Minigun.png", 3, 4);

#define weapon_name
return "PSY MINIGUN";

#define weapon_sprt
return global.sprPsyMinigun;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 2;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapPistol;

#define weapon_area
return 15;

#define weapon_text
return "IT WAS NICE KNOWING YOU";

#define weapon_fire

sound_play(sndMinigun)
wkick = 3
with instance_create(x,y,Shell)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+other.right*100+random(50)-25,2+random(5))
	image_blend = c_purple
}
with instance_create(x+lengthdir_x(sprite_height-6,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height-6,point_direction(x,y,mouse_x[index],mouse_y[index])),Bullet1)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(26)-13)*other.accuracy,16)
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
