#define init
global.sprPsyPopGun = sprite_add_weapon("Psy Pop Gun.png", 4, 2);

#define weapon_name
return "PSY POP GUN";

#define weapon_sprt
return global.sprPsyPopGun;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 3;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 6;

#define weapon_text
return "GOOBY";

#define weapon_fire

wkick = 2
sound_play(sndShotgun)
with instance_create(x,y,Shell)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+other.right*100+random(50)-25,2+random(5))
	image_blend = c_purple
}
	with instance_create(x+lengthdir_x(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),Bullet2)
	{
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(8)-4)*other.accuracy,16)
		image_angle = direction
		image_xscale *= 1.2
		image_yscale *= 1.2
		team = other.team
		damage *= 1.5
		speed *= 0.9
		timer = 2
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
								motion_add(point_direction(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y),1.3)
								image_angle = direction
						}
					}
				}
			}
		wait 1
		}while (instance_exists(self))
	}
