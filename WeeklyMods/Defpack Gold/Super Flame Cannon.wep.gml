#define init
global.sprSFC = sprite_add_weapon("SFC.png", 7, 4);
//FOR THE SPRITE TRY (NUKE LWANCHAIR + FIRE CANNON )/2
#define weapon_name
return "SUPER FLAME CANNON";

#define weapon_sprt
return global.sprSFC;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 155;

#define weapon_cost
return 8;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 15;

#define weapon_text
return "X MARKS THE SUN";

#define weapon_fire

wkick = 6
sound_play(sndGrenade)
with instance_create(x+lengthdir_x(sprite_height,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height,point_direction(x,y,mouse_x[index],mouse_y[index])),FlameBall)
{
team = other.team
speed = 0.8
image_xscale *= 2
image_yscale *= 2
dir = random(359)
damage *= 2
dirfac = random(359)
direction = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])
do
{
		speed += 0.018
		dirfac += 40/room_speed
		with instance_create(x,y,TrapFire)
		{
			team = other.team
			direction = random(359)
			speed = 3
		}
		with instance_create(x,y,TrapFire)
		{
			team = other.team
			direction = random(359)
			speed = 2.3
		}
		if x = xprevious && y = yprevious
		{
			repeat(3)
			{
				with instance_create(x,y,TrapFire)
				{
					team = other.team
					direction = instance_nearest(x,y,FlameBall).dirfac + 45
					speed = random_range(2,5)
				}
				with instance_create(x,y,TrapFire)
				{
					team = other.team
					direction = instance_nearest(x,y,FlameBall).dirfac + 135
					speed = random_range(2,5)
				}
				with instance_create(x,y,TrapFire)
				{
					team = other.team
					direction = instance_nearest(x,y,FlameBall).dirfac + 225
					speed = random_range(2,5)
				}
				with instance_create(x,y,TrapFire)
				{
					team = other.team
					direction = instance_nearest(x,y,FlameBall).dirfac + 315
					speed = random_range(2,5)
				}
			}
		}
	wait 1
}while (instance_exists(self))
}
