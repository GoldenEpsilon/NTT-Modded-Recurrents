#define init
global.sprShotCannon = sprite_add_weapon("Shot Cannon.png", 4, 2);
#define weapon_name
return "SHOT CANNON";

#define weapon_sprt
return global.sprShotCannon;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 25;

#define weapon_cost
return 10;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 7;

#define weapon_text
return "VORTEX-SHAPED DESTRUCTION";

#define weapon_fire

wkick = 6
sound_play(sndFlakCannon)
with instance_create(x+lengthdir_x(sprite_height,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height,point_direction(x,y,mouse_x[index],mouse_y[index])),CustomObject)
{
team = other.team
speed = 11
image_xscale *= 1.5
image_yscale *= 1.5
dir = random(359)
damage = 60
timer = 24
dirfac = random(359)
sprite_index = sprBullet2
image_index = 0
direction = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])
do
{
		if place_meeting(x+3,y,Wall) || place_meeting(x-3,y,Wall)
		{
			hspeed *= -1
		}
		if place_meeting(x,y+3,Wall) || place_meeting(x,y-3,Wall)
		{
			vspeed *= -1
		}
		scale = random_range(0.9,1.1)
		image_speed = 0
		dirfac += 10
		image_xscale = 1.5*scale
		image_yscale = 1.5*scale
		if speed > 1.0000000001
		{
			speed /= 1.6
		}
		else
		{
			speed = 0
			if x = xprevious && y = yprevious && timer > 1
			{
					sound_play(sndShotgun)
					with instance_create(x,y,Bullet2)
					{
						team = other.team
						if instance_exists(CustomObject)
						{
							direction = instance_nearest(x,y,CustomObject).dirfac
						}
						else
						{
							instance_destroy()
						}
						speed = 11
						image_angle = direction
					}
					with instance_create(x,y,Bullet2)
					{
						team = other.team
						if instance_exists(CustomObject)
						{
							direction = instance_nearest(x,y,CustomObject).dirfac + 75
						}
						else
						{
							instance_destroy()
						}
						speed = 11
						image_angle = direction
					}
					with instance_create(x,y,Bullet2)
					{
						team = other.team
						if instance_exists(CustomObject)
						{
							direction = instance_nearest(x,y,CustomObject).dirfac + 150
						}
						else
						{
							instance_destroy()
						}
						speed = 11
						image_angle = direction
					}
					with instance_create(x,y,Bullet2)
					{
						team = other.team
						if instance_exists(CustomObject)
						{
							direction = instance_nearest(x,y,CustomObject).dirfac + 225
						}
						else
						{
							instance_destroy()
						}
						speed = 11
						image_angle = direction
					}
					with instance_create(x,y,Bullet2)
					{
						team = other.team
						if instance_exists(CustomObject)
						{
							direction = instance_nearest(x,y,CustomObject).dirfac + 290
						}
						else
						{
							instance_destroy()
						}
						speed = 11
						image_angle = direction
					}

			}
				timer -= 1
				if timer <= 0
				{
					instance_destroy()
				}
		}
	wait 2
}while (instance_exists(self))
}
