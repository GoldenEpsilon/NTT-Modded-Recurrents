#define init
global.sprHotShotCannon = sprite_add_weapon("Hot Shot Cannon.png", 4, 2);
#define weapon_name
return "HOT SHOT CANNON";

#define weapon_sprt
return global.sprHotShotCannon;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 25;

#define weapon_cost
return 15;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 14;

#define weapon_text
return "PROTOPLANETARY ANNIHILATION";

#define weapon_fire

wkick = 6
sound_play(sndFireShotgun)
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
dirfac2 = dirfac
sprite_index = sprFireShell
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
		dirfac += 9
		dirfac2 -= 12
		image_xscale = 1.5*scale
		image_yscale = 1.5*scale
		if speed > 1.0000000001
		{
			speed /= 1.6
		}
		else
		{
			sound_play(sndShotgun)
			speed = 0
			if x = xprevious && y = yprevious && timer > 1
			{
					with instance_create(x,y,FlameShell)
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
						speed = 9
						image_angle = direction
					}
					with instance_create(x,y,FlameShell)
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
						speed = 9
						image_angle = direction
					}
					with instance_create(x,y,FlameShell)
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
						speed = 9
						image_angle = direction
					}
					with instance_create(x,y,FlameShell)
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
						speed = 9
						image_angle = direction
					}
					with instance_create(x,y,FlameShell)
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
						speed = 9
						image_angle = direction
					}
					with instance_create(x,y,FlameShell)
					{
						team = other.team
						if instance_exists(CustomObject)
						{
							direction = instance_nearest(x,y,CustomObject).dirfac2 + 240
						}
						else
						{
							instance_destroy()
						}
						speed = 16
						image_angle = direction
					}
					with instance_create(x,y,FlameShell)
					{
						team = other.team
						if instance_exists(CustomObject)
						{
							direction = instance_nearest(x,y,CustomObject).dirfac2 + 120
						}
						else
						{
							instance_destroy()
						}
						speed = 16
						image_angle = direction
					}
					with instance_create(x,y,FlameShell)
					{
						team = other.team
						if instance_exists(CustomObject)
						{
							direction = instance_nearest(x,y,CustomObject).dirfac2
						}
						else
						{
							instance_destroy()
						}
						speed = 16
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
