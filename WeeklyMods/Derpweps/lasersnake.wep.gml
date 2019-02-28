#define init
global.sprlasersnake = sprite_add_weapon("lasersnake.png", 3, 4);

#define weapon_name
return "LASER SNAKE"

#define weapon_sprt
return global.sprlasersnake;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 31;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 9;

#define weapon_text
return choose("VRRR");

#define weapon_fire
weapon_post(10,-25,6)
sound_play(sndLaserCannon)
with instance_create(x,y,EnergyShank)
{
	team = other.team
	creator = other
	damage = 20
	timer = 0
	timer2 = 0
	speed = 1
	image_xscale *= 1.0
	image_yscale *= 1.0
	motion_add(other.gunangle,11)
	//sprite_index = global.sprMutant8BIdle
	image_angle = direction
	do
	{
		timer -= 1
		if timer <= 0 && speed > 0
		{
			repeat(4)
			{
					with instance_create(x,y,Laser)
					{
						team = other.team
						creator = other
						damage = 1
						image_angle = random(359)
						speed += random_range(0.3,1)
						alarm0 = 1
					}
			}
		}
		if speed <= 0
		{
			timer2 -= 1
			if timer2 <= 0
			{
			instance_destroy()
			}
		}
		wait(1)
	}while(instance_exists(self))
}

