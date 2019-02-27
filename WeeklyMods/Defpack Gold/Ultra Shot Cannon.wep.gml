#define init
global.sprUltraShotCannon = sprite_add_weapon("Ultra Shot Cannon.png", 4, 2);
#define weapon_name
return "ULTRA SHOT CANNON";

#define weapon_sprt
return global.sprUltraShotCannon;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 20;

#define weapon_cost
return 10;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 20;

#define weapon_text
return "GREEN GALAXY OF TORMENT";

#define weapon_fire

wkick = 8
if GameCont.rad >= 120
{
	GameCont.rad -= 120
	sound_play(sndGrenadeShotgun)
	with instance_create(x+lengthdir_x(sprite_height,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height,point_direction(x,y,mouse_x[index],mouse_y[index])),CustomObject)
	{
	team = other.team
	speed = 11
	dir = random(359)
	damage = 60
	timer = 60
	dirfac = random(359)
	dirfac2 = dirfac
	sprite_index = sprUltraShell
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
			dirfac2 -= 20
			image_xscale = 1.2*scale
			image_yscale = 1.2*scale
			if speed > 1.0000000001
			{
				speed /= 1.6
			}
			else
			{
				speed = 0
				if x = xprevious && y = yprevious && timer > 1
				{
						sound_play(sndUltraShotgun)
						with instance_create(x,y,UltraShell)
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
							speed = 22
							image_angle = direction
						}
						with instance_create(x,y,UltraShell)
						{
							team = other.team
							if instance_exists(CustomObject)
							{
								direction = instance_nearest(x,y,CustomObject).dirfac-180
							}
							else
							{
								instance_destroy()
							}
							speed = 22
							image_angle = direction
						}
						with instance_create(x,y,UltraShell)
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
							speed = 11
							image_angle = direction
						}
						with instance_create(x,y,UltraShell)
						{
							team = other.team
							if instance_exists(CustomObject)
							{
								direction = instance_nearest(x,y,CustomObject).dirfac2-180
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
}
else
{
	sound_play(sndUltraEmpty)
	ammo[2] += 10
	with instance_create(x,y,PopupText)
	{
		mytext = "NOT ENOUGH RADS"
	}
}
