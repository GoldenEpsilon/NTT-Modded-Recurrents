#define init
global.sprUltraBulletCannon = sprite_add_weapon("Ultra Bullet Cannon.png", 4, 2);
#define weapon_name
return "ULTRA BULLET CANNON";

#define weapon_sprt
return global.sprUltraBulletCannon;

#define weapon_type
return 1;

#define weapon_auto
return false;

#define weapon_load
return 48;

#define weapon_cost
return 40;

#define weapon_swap
return sndSwapPistol;

#define weapon_area
return 20;

#define weapon_text
return "ASTRAL DESTRUCTION";

#define weapon_fire

wkick = 6
if GameCont.rad >= 150
{
	GameCont.rad -= 150
	sound_play(sndGrenadeShotgun)
	with instance_create(x+lengthdir_x(sprite_height,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height,point_direction(x,y,mouse_x[index],mouse_y[index])),CustomObject)
	{
	team = other.team
	speed = 20
	image_xscale *= 1.5
	image_yscale *= 1.5
	dir = random(359)
	dmage = 60
	timer = 35
	dirfac = random(359)
	sprite_index = sprUltraBullet
	direction = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])
	image_speed = 0
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
			dirfac += 34
			image_xscale = 1.2*scale
			image_yscale = 1.2*scale
			if speed > 1.0000000001
			{
				speed /= 1.4
			}
			else
			{
				speed = 0
				if x = xprevious && y = yprevious && timer > 1
				{
						sound_play(sndUltraPistol)
						with instance_create(x,y,UltraBullet)
						{
							team = other.team
							if instance_exists(CustomObject)
							{
								direction = instance_nearest(x,y,CustomObject).dirfac + 45
							}
							else
							{
								instance_destroy()
							}
							speed = 10
							image_angle = direction
						}
						with instance_create(x,y,UltraBullet)
						{
							team = other.team
							if instance_exists(CustomObject)
							{
								direction = instance_nearest(x,y,CustomObject).dirfac + 235
							}
							else
							{
								instance_destroy()
							}
							speed = 10
							image_angle = direction
						}
						with instance_create(x,y,UltraBullet)
						{
							team = other.team
							if instance_exists(CustomObject)
							{
								direction = instance_nearest(x,y,CustomObject).dirfac - 45
							}
							else
							{
								instance_destroy()
							}
							speed = 10
							image_angle = direction
						}
						with instance_create(x,y,UltraBullet)
						{
							team = other.team
							if instance_exists(CustomObject)
							{
								direction = instance_nearest(x,y,CustomObject).dirfac - 235
							}
							else
							{
								instance_destroy()
							}
							speed = 10
							image_angle = direction
						}
				}
					timer -= 1
					if timer = 0
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
	ammo[1] += 40
	with instance_create(x,y,PopupText)
	{
		mytext = "NOT ENOUGH RADS"
	}
}
